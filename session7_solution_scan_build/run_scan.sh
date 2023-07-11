for i in {0..40}
do

    for j in {0..20}
	do

        sleep 1
        offset=$(echo "scale=2; 0.2900 + 0.0005 * ${i}" | bc)
        rotation=$(echo "scale=2; 0.09400 + 0.0005*${j}" | bc)
	random_seed_1=$((i + 3))
	random_seed_2=$((j + 3))
	echo offset : $offset
        echo rotation : $rotation
	echo random seeds : $random_seed_1 $random_seed_2
	echo
        
        cp INTT_config_mother.mac INTT_config.mac
        sed -i "s/aaaa/${offset}/g" INTT_config.mac
        sed -i "s/bbbb/${rotation}/g" INTT_config.mac

	cp run_mother.mac run.mac
        sed -i "s/cccc/${random_seed_1}/g" run.mac
        sed -i "s/dddd/${random_seed_2}/g" run.mac
	
        sleep 1
        ./exampleED -t 10 -m run.mac > out_${i}_${j}.out
        
        sleep 1
        rm -f INTT_config.mac
	rm -f run.mac
    done  
done
