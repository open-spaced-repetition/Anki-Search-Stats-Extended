INCLUDED =  __init__.py graphs.min.js
OUT = addon.ankiaddon

$(OUT): $(INCLUDED)
	zip $(OUT).zip $(INCLUDED)
	mv $(OUT).zip $(OUT)

graphs.min.js: ts/src/* esbuild.mjs ts/src/protc
	npm run build

ts/src/protc:
	mkdir ts/src/proto -p

	npx protoc \
		-I anki/proto \
		--es_out ts/src/proto \
		--es_opt target=ts \
		anki/proto/anki/*.proto \