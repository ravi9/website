# register dataset
medperf auth login -e traincol2@example.com
medperf dataset create -p 1 -d datasets/col2 -l datasets/col2 --name col2 --description col2data --location col2location
medperf dataset submit -d $(medperf dataset ls | grep col2 | tr -s " " | cut -d " " -f 1) -y

# associate dataset
medperf training associate_dataset -t 1 -d 2 -y
