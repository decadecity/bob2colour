set -ex
python train.py --dataroot ./datasets/bob --name color_pix2pix --model colorization --gpu_ids -1 --continue_train
