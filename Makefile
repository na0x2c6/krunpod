PREFIX ?= ${HOME}/local
BINDIR ?= ${PREFIX}/bin
XDG_CONFIG_HOME ?= ${HOME}/.config
KRUNPOD_CONF ?= ${XDG_CONFIG_HOME}/krunpod/krunpod.conf
KRUNPOD_CONF_TEMPLATE ?= krunpod.conf.template

.PHONY: install
install: | ${KRUNPOD_CONF}
	@set -x; \
	for f in krunpod *.{sh,pl,pm} ; do \
		ln -sf $$(realpath $$f) ${PREFIX}/bin/ ; \
	done

${KRUNPOD_CONF}:
	mkdir -p $(dir ${KRUNPOD_CONF})
	cp ${KRUNPOD_CONF_TEMPLATE} $@
