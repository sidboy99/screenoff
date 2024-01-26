#!/bin/bash

while true; do
  # Check if the word "closed" is present in the lid state file
  if grep -q "closed" /proc/acpi/button/lid/LID/state; then
    echo "0" > /sys/class/backlight/amdgpu_bl0/brightness
    while true; do
      if grep -q "open" /proc/acpi/button/lid/LID/state; then
        echo "$brightness" > /sys/class/backlight/amdgpu_bl0/brightness
        break
      fi
      sleep 1
    done
  fi

  lid_state=$(</proc/acpi/button/lid/LID/state)

  # Log lid state and brightness for debugging (optional)
  echo "$lid_state"
  echo "$brightness"

  if grep -q "open" <<< "$lid_state"; then
    # Store brightness
    brightness=$(</sys/class/backlight/amdgpu_bl0/brightness)
  fi

  sleep 1
done

