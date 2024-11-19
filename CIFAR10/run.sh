
#for TARGET_CLASS in {0,1,2,3,4,5,6,7,8,9}
#do
#    echo "Analyzing target class:" $TARGET_CLASS
#    python patchattack_gaussian_ours.py --clp 1.25 --dr 2.0 --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/FNS/cifar10/uap --target=$TARGET_CLASS
#done

for TARGET_CLASS in {0,1,2,3,4,5,6,7,8,9}
do
    echo "Analyzing target class:" $TARGET_CLASS
    python patchattack_gaussian_ours.py --clp 1.25 --dr 2.0 --nonrob --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/FNS/cifar10/uap --target=$TARGET_CLASS
done

#test original model
#python patchattack_gaussian_ours.py --clp 1.25 --dr 2.0 --nonrob
#python patchattack_gaussian_ours.py --clp 1.25 --dr 2.0 --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/FNS/cifar10/uap --target=$TARGET_CLASS
#python patchattack_gaussian_ours.py --clp 1.25 --dr 2.0 --nonrob --uap_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/FNS/cifar10/uap --target=0
#dr = 1.0 is CFN
#python patchattack_exp_ours.py --clp 1.2 --dr 1.0

#for TARGET_CLASS in {0,1,2,3,4,5,6,7,8,9}
#do
#    echo "Analyzing target class:" $TARGET_CLASS
#    python patchattack_exp_ours.py --clp 1.2 --dr 2.0 --u1p_path=/root/autodl-tmp/sunbing/workspace/uap/my_result/FNS/cifar10/uap --target=$TARGET_CLASS
#done
