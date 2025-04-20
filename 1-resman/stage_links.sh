#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide the env variable as the first argument."
  exit 1
fi

env="$1" # environment
base_dir="../config-${env}" # base directory
outputs_dir="${base_dir}/outputs" # outputs directory
suffix=".json"  # suffix check on outputs files
current_dir=$(basename "$PWD") # current directory
tfvars_file="${base_dir}/tfvars/${current_dir}.auto.tfvars" # tfvars file
global_tfvars_file="${base_dir}/tfvars/0-globals.auto.tfvars" # global tfvars file
provider_file="${base_dir}/providers/${current_dir}-provider.tf" # provider file

# Check if config-${env} directory exists, if not exit
if [ ! -d "$base_dir" ]; then
  echo "Directory $base_dir does not exist."
  exit 1
fi

if [ -f "$tfvars_file" ]; then
  ln -sf "$tfvars_file" "./$(basename "$tfvars_file")"
  echo "Created soft link for: $tfvars_file"
else
  echo "File $tfvars_file does not exist."
fi

if [ -f "$global_tfvars_file" ]; then
  ln -sf "$global_tfvars_file" "./$(basename "$global_tfvars_file")"
  echo "Created soft link for: $global_tfvars_file"
else
  echo "File $global_tfvars_file does not exist."
fi

if [ -f "$provider_file" ]; then
  ln -sf "$provider_file" "./$(basename "$provider_file")"
  echo "Created soft link for: $provider_file"
else
  echo "File $provider_file does not exist."
fi

# if [ -d "$outputs_dir" ]; then
#   for file in "$outputs_dir"/*; do
#     if [ -f "$file" ]; then
#       # Check if the file has the desired suffix
#       if [[ "$file" == *"$suffix" ]]; then
#         ln -sf "$file" "./$(basename "$file")"
#         echo "Created soft link for: $file"
#       else
#         echo "Skipped $file (does not match suffix $suffix)"
#       fi
#     fi
#   done
# else
#   echo "Directory $outputs_dir does not exist."
# fi

echo "Soft link creation process completed."
