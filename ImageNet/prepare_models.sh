#vgg19
#fns-g
python train_gaussian_ours.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --model_type=3 --clp=1.13 --dr=2.0 --evaluate
#cfn
python train_exp.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --clp 1.1 --dr 1.0 --model 3 --evaluate

#resnet50
#fns-g
python train_gaussian_ours.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --model_type=0 --clp=1.13 --dr=2.0 --evaluate
#cfn
python train_exp.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --clp 1.1 --dr 1.0 --model 0 --evaluate

#googlenet
#fns-g
python train_gaussian_ours.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --model_type=4 --clp=1.13 --dr=2.0 --evaluate
#cfn
python train_exp.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --clp 1.1 --dr 1.0 --model 4 --evaluate