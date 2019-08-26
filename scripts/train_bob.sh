set -ex
python train.py --dataroot ./datasets/bob --name bob2colour --model colorization --gpu_ids -1 \
    --save_epoch_freq 1 --display_freq 100 --save_latest_freq 1000 --update_html_freq 100  --continue_train
