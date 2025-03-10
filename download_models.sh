# ZoeDepth
rm -rf models/monoD/zoeDepth/ckpts
mkdir models/monoD/zoeDepth/ckpts
curl -L https://github.com/isl-org/MiDaS/releases/download/v3_1/dpt_beit_large_384.pt -o models/monoD/zoeDepth/ckpts/dpt_beit_large_384.pt
curl -L https://github.com/isl-org/ZoeDepth/releases/download/v1.0/ZoeD_M12_K.pt -o models/monoD/zoeDepth/ckpts/ZoeD_M12_K.pt
curl -L https://github.com/isl-org/ZoeDepth/releases/download/v1.0/ZoeD_M12_NK.pt -o models/monoD/zoeDepth/ckpts/ZoeD_M12_NK.pt
sleep 5

# spat checkpoint
echo IF THE FOLLOWING FAILS DO \`pip install gdown\`
mkdir -p ./checkpoints
cd ./checkpoints
gdown 18YlG_rgrHcJ7lIYQWfRz_K669z6FdmUX
cd ..
sleep 5

# examples (RGB)
cd -p ./assets
gdown 1BDtvfrvbzEFY84XJPp62Dq1PujIpbOK_
gdown 1hlAGFony7LzpLcEAoGLiNaY3zxfiN_bW
sleep 5

# done
echo "Done"
