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
