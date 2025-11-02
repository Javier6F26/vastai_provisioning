#!/bin/bash

source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/christian-byrne/audio-separation-nodes-comfyui.git"
    "https://github.com/giriss/comfy-image-saver.git"
    "https://github.com/kaibioinfo/ComfyUI_AdvancedRefluxControl.git"
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git"
    "https://github.com/Fannovel16/comfyui_controlnet_aux.git"
    "https://github.com/cubiq/ComfyUI_essentials.git"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus.git"
    "https://github.com/chflame163/ComfyUI_LayerStyle.git"
    "https://github.com/SeargeDP/ComfyUI_Searge_LLM.git"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git"
    "https://github.com/chibiace/ComfyUI-Chibi-Nodes.git"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git"
    "https://github.com/yolain/ComfyUI-Easy-Use.git"
    "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git"
    "https://github.com/city96/ComfyUI-GGUF.git"
    "https://github.com/SLAPaper/ComfyUI-Image-Selector.git"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack.git"
    "https://github.com/ltdrdata/ComfyUI-Impact-Subpack.git"
    "https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch.git"
    "https://github.com/kijai/ComfyUI-KJNodes.git"
    "https://github.com/kijai/ComfyUI-Lotus.git"
    "https://github.com/comfyuistudio/ComfyUI-Studio-nodes.git"
    "https://github.com/theUpsider/ComfyUI-Styles_CSV_Loader.git"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git"
    "https://github.com/kijai/ComfyUI-WanVideoWrapper.git"
    "https://github.com/bash-j/mikey_nodes.git"
    "https://github.com/rgthree/rgthree-comfy.git"
    "https://github.com/WASasquatch/was-node-suite-comfyui.git"
    "https://github.com/crystian/ComfyUI-Crystools.git"
    "https://github.com/calcuis/gguf.git"
)

# shellcheck disable=SC2034
WORKFLOWS=(

)

CHECKPOINT_MODELS=(

)

UNET_MODELS=(
"https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"
"https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"
"https://civitai.com/api/download/models/2260110?type=Model&format=SafeTensor&size=pruned&fp=fp8"
"https://civitai.com/api/download/models/2259006?type=Model&format=SafeTensor&size=pruned&fp=fp8"
)

LORA_MODELS=(
"https://civitai.com/api/download/models/1605427?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2195862?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2195866?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2318876?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2318856?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2318821?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2183383?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2183388?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2230125?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2230133?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2341107?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2341104?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/1545040?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2318465?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2318489?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/1946096?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/1970145?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2183383?type=Model&format=SafeTensor"
"https://civitai.com/api/download/models/2183388?type=Model&format=SafeTensor"
)

VAE_MODELS=(
"https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors"
)

ESRGAN_MODELS=(
)

CONTROLNET_MODELS=(
)

CLIP_MODELS=(
"https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors"
"https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors"
)


### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/clip" \
        "${CLIP_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_apt_packages() {
    # shellcheck disable=SC2128
    if [[ -n $APT_PACKAGES ]]; then
            # shellcheck disable=SC2068
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    # shellcheck disable=SC2128
    if [[ -n $PIP_PACKAGES ]]; then
            # shellcheck disable=SC2068
            pip install --no-cache-dir ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip install --no-cache-dir -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip install --no-cache-dir -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi

    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    if [[ -n $auth_token ]];then
        wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    fi
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi