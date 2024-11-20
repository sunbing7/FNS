#python train_exp.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation_folder/ --model_type=0 --clp=1.0 --evaluate
#python train_exp.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation_folder/ --model_type=0 --clp=0.0 --evaluate
#python train_exp.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation_folder/ --model_type=0 --clp=1.1 --evaluate

#comparison
#python patchattack_models_danse.py --clp=0 --model_type=0 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/FNS/src/ImageNet/uap/ --target=174

#for TARGET_CLASS in {755,743,804,700,922,174,547,369}
#do
#    echo "Analyzing target class:" $TARGET_CLASS
#    python patchattack_danse.py --clp=0.0 --model_type=0 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/FNS/src/ImageNet/uap/ --target=$TARGET_CLASS
#    python patchattack_danse.py --clp=1.0 --model_type=0 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/FNS/src/ImageNet/uap/ --target=$TARGET_CLASS
#    python patchattack_danse.py --clp=1.1 --model_type=0 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/FNS/src/ImageNet/uap/ --target=$TARGET_CLASS
#done

#python train_gaussian.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --model_type=0 --clp=1.0 --evaluate
#python train_gaussian.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --model_type=0 --clp=0.0 --evaluate
#python train_gaussian.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --model_type=0 --clp=1.1 --evaluate

#python train_gaussian.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --model_type=0 --clp=1.0 --dr 2.0 --evaluate
for TARGET_CLASS in {755,743,804,700,922,174,547,369}
do
    echo "Analyzing target class:" $TARGET_CLASS
    python patchattack_gaussian_ours.py --clp 1.0 --dr 2.0 --model 0 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/FNS/ImageNet/uap/ --target=$TARGET_CLASS
done

#test original model
python patchattack_gaussian_ours.py --clp 1.25 --dr 2.0 --nonrob
python patchattack_gaussian_ours.py --clp 1.25 --dr 2.0

#dr = 1.0 is CFN
python patchattack_exp_ours.py --clp 1.2 --dr 1.0


#vgg19
#fns-g
#python train_gaussian_ours.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --model_type=3 --clp=1.13 --dr=2.0 --evaluate
#cfn
#python train_exp.py /root/autodl-tmp/sunbing/workspace/uap/data/imagenet_sga/ --clp 1.1 --dr 1.0 --model 3 --evaluate

for TARGET_CLASS in T_CLASS in {150,214,39,527,65,639,771,412}
do
    echo "Analyzing target class:" $TARGET_CLASS
    python patchattack_gaussian_ours.py --clp 1.13 --dr 2.0 --model 3 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/FNS/ImageNet/uap/ --target=$TARGET_CLASS
done

#python patchattack_gaussian_ours.py --clp 1.13 --dr 2.0 --model 3 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_vgg19_123 --target=150
#python patchattack_exp_ours.py --clp 1.1 --dr 1.0 --model 3 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_vgg19_123 --target=150


#resnet50
python patchattack_gaussian_ours.py --clp 1.0 --dr 2.0 --model 0 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_resnet50_123 --target=755
python patchattack_exp_ours.py --clp 1.1 --dr 1.0 --model 0 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_resnet50_123 --target=755

#googlenet {573,807,541,240,475,753,762,505}
python patchattack_gaussian_ours.py --clp 1.0 --dr 2.0 --model 4 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_googlenet_123 --target=573
python patchattack_exp_ours.py --clp 1.1 --dr 1.0 --model 4 --data=/root/autodl-tmp/sunbing/workspace/uap/data/imagenet/validation/ --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/uap_virtual_data.pytorch/uap/imagenet_imagenet_googlenet_123 --target=573
