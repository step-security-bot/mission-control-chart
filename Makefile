.PHONY: chart-local
	helm dependency update ./chart
	cd chart && tar -xvf charts/kratos-0.25.*.tgz -C charts && rm charts/kratos-0.25.*.tgz && rm charts/kratos/templates/configmap-config.yaml && cd ..
	helm template -f ./chart/values.yaml incident-manager ./chart

.PHONY: chart
chart:
	helm dependency build ./chart
	cd chart && tar -xvf charts/kratos-0.25.*.tgz -C charts && rm charts/kratos-0.25.*.tgz && rm charts/kratos/templates/configmap-config.yaml && cd ..
	helm package ./chart
