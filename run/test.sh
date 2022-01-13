#!/bin/bash
#SBATCH --partition=dell
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:V100:1
#SBATCH -J Autoformer
#SBATCH -o log/job-%j.log
#SBATCH -e log/job-%j.err
# shellcheck disable=SC2046
# shellcheck disable=SC2006
echo Time is `date`
echo Directory is $PWD
echo This job runs on the following nodes:
echo "$SLURM_JOB_NODELIST"
cd ..
eval "$(conda shell.bash hook)"
source /home/LAB/anaconda3/bin/activate base
# conda --version
# which python
conda activate gch
echo Python:
which python
export NCCL_IB_DISABLE=1
# export NCCL_DEBUG=INFO
# export NCCL_DEBUG_SUBSYS=ALL
export MKL_THREADING_LAYER=GNU
export CUDA_HOME=/usr/local/cuda-10.2
# sugon does not support infiniband
srun python -u run.py \
  --is_training 1 \
  --root_path /home/LAB/gaoch/data/ETDataset/ETT-small/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_24 \
  --model Autoformer \
  --data ETTh1 \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 24 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --itr 1

python -u run.py \
  --is_training 1 \
  --root_path /home/LAB/gaoch/data/ETDataset/ETT-small/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_48 \
  --model Autoformer \
  --data ETTh1 \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 48 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --itr 1

python -u run.py \
  --is_training 1 \
  --root_path /home/LAB/gaoch/data/ETDataset/ETT-small/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_168 \
  --model Autoformer \
  --data ETTh1 \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 168 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --itr 1

python -u run.py \
  --is_training 1 \
  --root_path /home/LAB/gaoch/data/ETDataset/ETT-small/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_336 \
  --model Autoformer \
  --data ETTh1 \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --itr 1

python -u run.py \
  --is_training 1 \
  --root_path /home/LAB/gaoch/data/ETDataset/ETT-small/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_720 \
  --model Autoformer \
  --data ETTh1 \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --itr 1