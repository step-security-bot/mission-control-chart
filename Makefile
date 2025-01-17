.PHONY: chart-local
chart-local:
	helm dependency update ./chart
	helm template -f ./chart/values.yaml mission-control ./chart

.PHONY: chart
chart:
	helm dependency build ./chart
	helm package ./chart
