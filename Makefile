GRAMMARS=$(patsubst crp_utils/grammars/%.pegjs,crp_utils/processed_grammars/%.pegjs,$(wildcard crp_utils/grammars/*.pegjs))
PARSERS=$(patsubst crp_utils/grammars/%.pegjs,crp_utils/parsers/%.js,$(wildcard crp_utils/grammars/*.pegjs))

all: $(PARSERS)
	@printf "$(PARSERS)\n"

grammars: $(GRAMMARS)

crp_utils/processed_grammars/%.pegjs: crp_utils/grammars/%.pegjs crp_utils/preprocessor/metagrammar.pegjs
	peggy --trace crp_utils/preprocessor/metagrammar.pegjs -T "$<" > "$@.temp"
	head -n -1 "$@.temp" > "$@"
	rm "$@.temp"


crp_utils/parsers/%.js: crp_utils/processed_grammars/%.pegjs
	peggy -o $@ $< --format globals -e "$*_parser"