serve:
	bundle exec jekyll serve

update_content: update_calendar update_eagles update_upcoming
	echo "Updated"

update_calendar:	
	clear &&ruby getters/calendar2.rb

update_eagles:
	curl -o ./_data/honorRoll.csv https://docs.google.com/spreadsheets/u/0/d/179WlVyc4_UAoSROOCaJuTPlS6RQ3sd98Y7gj08s2wHM/export?format=csv&id=179WlVyc4_UAoSROOCaJuTPlS6RQ3sd98Y7gj08s2wHM&gid=0

update_upcoming:
	wget -O ./_data/upcoming.csv https://docs.google.com/spreadsheets/u/0/d/17neqpDL3IfA2H4AzTI5w-7QxKcmRM_Y6Vio8IN67upk/export\?format\=csv\&id\=17neqpDL3IfA2H4AzTI5w-7QxKcmRM_Y6Vio8IN67upk\&gid\=0