## Custom functions
## ==============

function passgen () {
  # Generate random passwords

  # Take length of password as argument
  local len="${1}"

  # Set default length of password
  [[ "${len}" == "" ]] && len=25

  # Generate passwords
  tr -cd 0-9A-Za-z_ < /dev/urandom | fold -w"${len}" | head -n5
}

function clear() {
  # This function restore the old behaviour of clear command, to keep the
  # scrollback intact, and put the cursor on the top of terminal

  local rows

  rows="$(tput lines)"

  # Add empty rows and columns to scrollback for clear command to erase
  for (( i=1; i<"${rows}"; i++ )); do
    printf '\n'
  done

  # Run the clear command
  command clear -x
}

function vagrant() {
  # Run vagrant and vagrant-libvirt (plugin) in docker.
  # The idea is to isolate vagrant-libvirt (plugin) and
  # Ruby (runtime dependency) from the system

  # Specify docker image tag
  declare -r docker_image_tag="0.12-slim"

  # Follow symlink and find out the full absolute path
  declare -r pwd_real_path="$(realpath "${PWD}")"

  # Pass all the arguments to container and start
  docker run -it --rm \
    -e LIBVIRT_DEFAULT_URI \
    -v /var/run/libvirt/:/var/run/libvirt/:ro \
    -v ~/.vagrant.d:/.vagrant.d \
    -v "${pwd_real_path}":"${PWD}" \
    -w "${pwd_real_path}" \
    --network host \
    "vagrantlibvirt/vagrant-libvirt:${docker_image_tag}" \
      vagrant "$@"
}
