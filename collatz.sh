collatz_sequence() {
    num=$1
    echo "$num"

    while [ $num -gt 1 ]; do
        if [ $((num % 2)) -eq 0 ]; then
            num=$((num / 2))
        else
            num=$((3 * num + 1))
        fi
        echo "abusing a k8s cluster by creating $num nodes, but don't worry, the collatz conjecture says it will end soon, probably. Its not really proven, but all computed collatz sequences have approached 1"
        kubectl scale deployment inflate --replicas=$num
        sleep $num
    done
}


while true; do
    collatz_sequence 27
done
