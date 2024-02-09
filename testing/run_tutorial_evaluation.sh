# This to be run after training

# submit reference model
medperf auth login -e benchmarkowner@example.com
medperf mlcube submit -n refmodel \
    -m https://storage.googleapis.com/medperf-storage/testfl/mlcube_other.yaml

# submit metrics mlcube
medperf mlcube submit -n metrics \
    -m https://storage.googleapis.com/medperf-storage/testfl/mlcube_metrics.yaml \
    -p https://storage.googleapis.com/medperf-storage/testfl/parameters_metrics.yaml

# submit benchmark metadata
medperf benchmark submit --name pathmnistbmk --description pathmnistbmk \
    --demo-url https://storage.googleapis.com/medperf-storage/testfl/data/sample.tar.gz \
    -p 1 -m 3 -e 4

# mark as approved
bash admin_benchmark_approval.sh

# submit trained model
medperf auth login -e modelowner@example.com
medperf mlcube submit -n trained \
    -m https://storage.googleapis.com/medperf-storage/testfl/mlcube_trained.yaml

# participatemedperf benchmark submit
medperf mlcube associate -b 1 -m 5 -y

# submit inference dataset
medperf auth login -e testcol@example.com
medperf dataset create -p 1 -d datasets/test -l datasets/test --name testdata --description testdata --location testdata
medperf dataset submit -d $(medperf dataset ls | grep test | tr -s " " | cut -d " " -f 1) -y

# associate dataset
medperf dataset associate -b 1 -d 3 -y

# approve associations
medperf auth login -e benchmarkowner@example.com
medperf association approve -b 1 -m 5
medperf association approve -b 1 -d 3

# run inference
medperf auth login -e testcol@example.com
medperf benchmark run -b 1 -d 3

# submit result
medperf result submit -r b1m5d3 -y
medperf result submit -r b1m3d3 -y


# read results
medperf auth login -e benchmarkowner@example.com
medperf result view -b 1

############ test other stuff
medperf auth login -e modelowner@example.com
medperf training ls
medperf aggregator ls
medperf training view 1
medperf aggregator view 1
medperf training list_associations
