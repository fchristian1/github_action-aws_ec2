data "external" "generate_ipfile-server" {
  depends_on = [module.aws-instances-webserver]

  program = ["bash", "-c", <<EOT
    FILE="./terraform/type_ips"
    > $FILE
    for ip in ${join(" ", module.aws-instances-webserver[*].public_ip)}; do
      echo "server:$ip" >> $FILE
    done

    echo "{\"status\": \"success\"}"
  EOT
  ]
}
data "external" "generate_inventory_first" {
  depends_on = [data.external.generate_ipfile-server]

  program = ["bash", "-c", <<EOT
    INVENTORY_FILE="./ansible/inventory"
    echo "[all:vars]" > $INVENTORY_FILE
    echo "ansible_ssh_user=ubuntu" >> $INVENTORY_FILE
    echo "ansible_ssh_private_key_file=./../my_key.pem" >> $INVENTORY_FILE
    
    echo "{\"status\": \"success\"}"
  EOT
  ]
}
data "external" "generate_inventory-sec" {
  depends_on = [data.external.generate_inventory_first]

  program = ["bash", "./generate_inventory.sh"]
}