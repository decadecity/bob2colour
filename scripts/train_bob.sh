set -ex
python train.py --dataroot ./datasets/bob --name bob2colour --model colorization --gpu_ids -1 \
    --save_epoch_freq 1 --save_by_iter --display_freq 100 --update_html_freq 100
