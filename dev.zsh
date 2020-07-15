SITES_FOLDER='/media/aamnah/Files/Sites'

dev_frn() {
  # open everything i have to open to write code for the Expo React Native project

  # change to project directory
  cd ${SITES_FOLDER}/fppreactnative

  # run Android emulator in background (that's what the `&` at the end is for)
  # emulator @Pixel_3a_API_29 &

  # open a new terminal and run the command there
  # doing this because running debugger with `&` wasn't giving me the prompt back
  xterm -e emulator @Pixel_3a_API_29 &

  # open React Native Debugger
  # react-native-debugger &
  xterm -e react-native-debugger &

  # run Expo app on Android emulator
  expo start --android --clear

  # if it doesn't open the app inn the emulator, press 'a' in the terminal 
  # where Expo is running to manual start the app on connected Android device
}

dev () {
  if [[ "$#" -eq 0 ]]; then # if no. of args provided is 0
    echo -e "\n please pass a project to open. e.g. dev frn \n"
    return 1 # non-zero for failure
    
  elif [[ "$#" -gt 1 ]]; then # no. of args provided is more than 1
    echo -e "\n you can only open 1 project for development with this command"
    return 1

  elif [ "$1" = "-h" ] || [ "$1" == "--help" ]; then
    echo -e "\n pass a project name to the dev command. e.g. dev frn \n the projects you have are: \n frn"

  elif [[ "$1" = "frn" ]]; then
    dev_frn
  fi
}
