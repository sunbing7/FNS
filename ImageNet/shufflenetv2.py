import torch.nn as nn
import torch.nn.functional as F
from torchvision import models
from torchsummary import summary
import torch
import numpy as np
import math

def shufflenetv2(num_classes=10, pretrained=1, **kwargs):
    net = models.shufflenet_v2_x1_0(pretrained=pretrained)
    net.aux_logits = False

    if pretrained:
        for param in net.parameters():
            param.requires_grad = False

    net.fc = nn.Sequential(
        nn.Linear(net.fc.in_features, 4096),
        nn.Linear(4096, num_classes)
    )

    return net

def test():
    net = shufflenetv2(num_classes=101)

    summary(net, (3, 224, 224))
#test()

class ShuffleNetv2(nn.Module):
    def __init__(self, is_gausian=False):
        super(ShuffleNetv2, self).__init__()
        self.shufflenetv2 = shufflenetv2(pretrained=True)
        self.is_gausian = is_gausian

    def clamp(self, x, a=1.0, dr=1.0):
        norm = torch.norm(x, dim=1, keepdim=True)
        thre = torch.mean(torch.mean(a * norm, dim=2, keepdim=True), dim=3, keepdim=True)
        x = x / torch.clamp_min(norm, min=1e-7)
        mask = (norm > thre).float()
        if self.is_gausian:
            normd = thre * torch.exp(-1 / thre / thre * (norm - thre) * (norm - thre) * math.log(dr))
        else:
            normd = thre * torch.exp(-1 / thre * (norm - thre) * math.log(dr))
        norm = norm * (1 - mask) + normd * mask
        x = x * norm
        return x

    def forward_with_hook(self, input):

        return input

    def forward_without_hook(self, input):
        x = input
        x = self.shufflenetv2.conv1(x)
        x = self.shufflenetv2.stage2(x)
        x = self.shufflenetv2.stage3(x)
        x = self.shufflenetv2.stage4(x)
        x = self.shufflenetv2.conv5(x)
        x = x.mean([2, 3])
        #x = F.avg_pool2d(x, 7)
        #x = x.view(x.size(0), -1)
        x = self.shufflenetv2.fc(x)
        return x

    def forward(self, input):
        #x = self.forward_with_hook(input)
        x = self.forward_without_hook(input)
        return x