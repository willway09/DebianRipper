files=$(ls | grep .deb);

rm data.tar;
for i in $files; do
	7z x $i;
	tar xvf data.tar
	rm data.tar;
done

tar cvf data.tar $(ls | grep  -E "^(bin|boot|dev|efi|etc|home|lib|lib64|lost+found|mnt|opt|proc|root|run|sbin|srv|sys|tmp|usr|var|)$")
