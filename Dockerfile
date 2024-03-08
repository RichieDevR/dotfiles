FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y curl zsh

# Create the dotfiles directory and copy the contents
RUN mkdir /dotfiles
COPY dotfiles /dotfiles

# Copy your script into the container
COPY install_script.sh /install_script.sh

# Set the script as executable
RUN chmod +x /install_script.sh

# Run the script
CMD ["/install_script.sh"]
