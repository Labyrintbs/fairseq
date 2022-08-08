#!bin/bash
echo 'run resynthesis test'
FAIRSEQ_ROOT=/home/si/intern/fang_hongming/fairseq
TYPE=hubert
ACOUSTIC_MODEL_PATH=/home/si/intern/fang_hongming/.textless/hubert_base_ls960.pt
LAYER=6 #to be tested
KM_MODEL_PATH=/home/si/intern/fang_hongming/.textless/hubert_base_ls960_km100.pt #/home/si/intern/zhang_leiting/_codes/new_fairseq/examples/textless_nlp/gslm/km_model/hubert/km100/km.bin
TTS_MODEL_PATH=/home/si/intern/fang_hongming/.textless/hubert_base_ls960_kmeans_100_tacotron.pt
# A text file containing the codes, one per line
CODE_DICT_PATH=/home/si/intern/zhang_leiting/_codes/new_fairseq/examples/textless_nlp/gslm/s2u_weight/hubert/km100/code_dict
WAVEGLOW_PATH=/home/si/intern/fang_hongming/.textless/waveglow_256channels_standalone.pt

PYTHONPATH=${FAIRSEQ_ROOT}:${FAIRSEQ_ROOT}/examples/textless_nlp/gslm/unit2speech python ${FAIRSEQ_ROOT}/examples/textless_nlp/gslm/tools/resynthesize_speech.py \
	    --feature_type $TYPE \
		    --acoustic_model_path $ACOUSTIC_MODEL_PATH \
			    --layer $LAYER \
				    --kmeans_model_path $KM_MODEL_PATH \
					    --tts_model_path $TTS_MODEL_PATH \
						    --code_dict_path $CODE_DICT_PATH \
							    --waveglow_path $WAVEGLOW_PATH \
								    --max_decoder_steps 2000
