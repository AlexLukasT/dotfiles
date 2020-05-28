import subprocess

def main():
    try:
        artist = subprocess.check_output("playerctl metadata artist", shell=True,
                stderr=subprocess.DEVNULL)
        title = subprocess.check_output("playerctl metadata title", shell=True,
                stderr=subprocess.DEVNULL) 
        artist = artist.decode("utf-8").strip()
        title = title.decode("utf-8").strip()
        print(" {}: {}".format(artist, title))
    except subprocess.CalledProcessError as e:
        print("")

if __name__ == "__main__":
    main()
