# Paul Solovyov - Magento Indexing Process Killer

## Main Functionalities
Add this bash script to your crontab to kill a stuck indexing process. Run it every 5 minutes.

Magento indexing with large catalogs usually has serious problems. Sometimes an index process gets stuck and does not get finished.

Bash script will kill the indexing process that is stuck and allow a new one to be created, therefore finishing the indexing process.

This is a temporary fix until you figure out issues with the indexing, but works really well. 


## Adjustments
 - You will need to make adjustments to the timing `if [[ $time -gt 9000 ]] ; then` depending on your shop.
 - Another adjustment needs to be done to the logging path `done;)|tee -a "/var/www/php/var/log/indexkiller.log"`