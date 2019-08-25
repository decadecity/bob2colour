set -ex
python train.py --dataroot ./datasets/bob --name bob --model colorization --gpu_ids -1 --continue_train
