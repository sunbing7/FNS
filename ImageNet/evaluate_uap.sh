#vgg19
#python patchattack_gaussian_ours.py --clp 1.13 --dr 2.0 --model 3 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_vgg19_123 --target=150
#python patchattack_exp_ours.py --clp 1.1 --dr 1.0 --model 3 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_vgg19_123 --target=150

#resnet50
python patchattack_gaussian_ours.py --clp 1.0 --dr 2.0 --model 0 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_resnet50_123 --target=755
python patchattack_exp_ours.py --clp 1.1 --dr 1.0 --model 0 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_resnet50_123 --target=755

#googlenet {573,807,541,240,475,753,762,505}
python patchattack_gaussian_ours.py --clp 1.0 --dr 2.0 --model 4 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_googlenet_123 --target=573
python patchattack_exp_ours.py --clp 1.1 --dr 1.0 --model 4 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_googlenet_123 --target=573
