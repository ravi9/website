# THIS is for developers to test the whole tutorial

## Run the local medperf server

## reset everything:
# cd ../medperf/server
# bash reset_db.sh
# sudo rm -rf keys
# sudo rm -rf ~/.medperf

## seed
# python seed.py --demo benchmark

# activate local profile
# medperf profile activate local

## All above are already done if using codespaces.
## go to the tutorial ws. start running the tutorial.

# login
medperf auth login -e modelowner@example.com

# register prep mlcube
medperf mlcube submit -n prep \
    -m https://storage.googleapis.com/medperf-storage/rsna2023/mlcube.yaml

# register training mlcube
medperf mlcube submit -n testfl \
    -m https://storage.googleapis.com/medperf-storage/rsna2023/mlcube_rsna.yaml \
    -p https://storage.googleapis.com/medperf-storage/rsna2023/plan_final.yaml \
    -a https://storage.googleapis.com/medperf-storage/rsna2023/init_weights_rsna2023.tar.gz

# register training exp
medperf training submit -n testtrain -d testtrain -p 1 -m 2

# mark as approved
bash admin_training_approval.sh

# register aggregator
medperf auth login -e aggowner@example.com
medperf aggregator submit -n testagg -a $(hostname -A | cut -d " " -f 1) -p 50273

# associate aggregator
medperf aggregator associate -a 1 -t 1 -y


# register dataset
medperf auth login -e traincol1@example.com
medperf dataset create -p 1 -d datasets/col1 -l datasets/col1 --name col1 --description col1data --location col1location
medperf dataset submit -d $(medperf dataset ls | grep col1 | tr -s " " | cut -d " " -f 1) -y

# associate dataset
medperf training associate_dataset -t 1 -d 1 -y

# shortcut
bash collab_shortcut.sh

# approve associations
medperf auth login -e modelowner@example.com
medperf training approve_association -t 1 -a 1
medperf training approve_association -t 1 -d 1
medperf training approve_association -t 1 -d 2

# lock experiment
medperf training lock -t 1


# # start aggregator
medperf auth login -e aggowner@example.com
medperf aggregator start -a 1 -t 1

sleep 5

exit  # Run below in NEW TERMINALS

# # start collaborator 1
medperf auth login -e traincol1@example.com
medperf training run -d 1 -t 1

sleep 5

# # start collaborator 2
medperf auth login -e traincol2@example.com
medperf training run -d 2 -t 1
