echo "Setting cron jobs..."

CRON=$(mktemp)

crontab -l > $CRON || true

echo "0 9 * * * /home/cs2server/cs2server restart" >> $CRON
echo "0 8 * * * /home/cs2server/cs2server update" >> $CRON
echo "0 18 * * * /home/cs2server/cs2server monitor" >> $CRON
echo "0 9 * * 5 /home/cs2server/cs2server lgsm-update" >> $CRON

crontab $CRON
rm $CRON