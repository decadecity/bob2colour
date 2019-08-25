set -ex
python train.py --dataroot ./datasets/hurricane --name hurricane2colour --model colorization --gpu_ids -1 --continue_train
