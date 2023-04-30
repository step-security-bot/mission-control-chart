.PHONY: chart-local
chart-local:
	helm dependency update ./chart
	cd chart && tar -xvf charts/kratos-0.32.*.tgz -C charts && rm charts/kratos-0.32.*.tgz && rm charts/kratos/templates/configmap-config.yaml && cd ..
	helm template -f ./chart/values.yaml mission-control ./chart

.PHONY: chart
chart:
	helm dependency build ./chart
	cd chart && tar -xvf charts/kratos-0.32.*.tgz -C charts && rm charts/kratos-0.32.*.tgz && rm charts/kratos/templates/configmap-config.yaml && cd ..
	helm package ./chart
