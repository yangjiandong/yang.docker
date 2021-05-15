docker run --rm \
  -e DISPLAY=${DISPLAY} \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.Idea:/home/developer/.Idea \
  -v ~/.Idea.java:/home/developer/.java \
  -v ~/.Idea.maven:/home/developer/.m2 \
  -v ~/.Idea.gradle:/home/developer/.gradle \
  -v ~/.Idea.share:/home/developer/.local/share/JetBrains \
  -v ~/Project:/home/developer/Project \
  --name idea-$(head -c 4 /dev/urandom | xxd -p)-$(date +'%Y%m%d-%H%M%S') \
rycus86/intellij-idea-pro:latest
