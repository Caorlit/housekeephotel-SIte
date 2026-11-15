# housekeephotel.com – sito pubblicato

Questo repository contiene **solo il sito già compilato** (cartella `public/`) e lo script per pubblicarlo.
**Non modificare i file a mano**: i sorgenti (testi in italiano, inglese e spagnolo, grafica, immagini)
stanno nel repository dell'app, `Caorlit/housekeephotel-v2`, cartella `sito/` (vedi `sito/LEGGIMI.md`).

Aggiornare il sito:
1. nel repository dell'app: `bash sito/esporta.sh` (compila e copia qui in `public/`), poi commit e push di questo repository;
2. sul server: `cd ~/websites/<ID-SITO>/.h5g/sito && bash pubblica.sh`, poi svuotare la cache della CDN.
