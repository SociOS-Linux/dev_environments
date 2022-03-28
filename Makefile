.PHONY: prophet clean_prophet cleanest_prophet
# prophet
prophet:
	cd setup && bash setup_prophet.sh
	@echo "*** Activate your environment with ***"
	@echo "   source setup/activate_prophet.sh"


clean_prophet:
	@echo `conda env remove --name prophet`

cleanest_prophet: clean_prophet
	rm -rf ~/odbc_cli
	rm -rf ~/anaconda3
	@echo "*** Remember to end this session to complete the removal of conda ***"


# prophet_mac is the environment used for Agent on MacOS (e.g. for container building)
.PHONY: prophet_mac clean_prophet_mac cleanest_prophet_mac
prophet_mac:
	cd setup && bash setup_prophet_mac.sh

clean_prophet_mac:
	conda env remove --name prophet_mac
