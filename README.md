# 🎓 Appunti e materiale universitario – Ingegneria Informatica e dell’Automazione (PoliBa)

Repository pubblica di Daniele Di Spirito con appunti personali, dispense, esercizi, codice e materiale didattico del corso di **Ingegneria Informatica e dell’Automazione** presso il **Politecnico di Bari**.

Il materiale è destinato all’uso personale e accademico. La diffusione pubblica e la condivisione non autorizzata del contenuto non sono consentite; le dispense conservano i riferimenti ai rispettivi autori.

## 📂 Struttura

Il materiale è organizzato per anno e insegnamento. Questa panoramica include anche le cartelle locali escluse da Git, indicate sotto.

```text
uni/
├── primo_anno/
│   ├── analisi/
│   ├── chimica/
│   ├── economia/
│   ├── fisica/
│   ├── geometria/
│   ├── informatica/
│   │   ├── algoritmi/
│   │   └── matlab/
│   └── java/
├── secondo_anno/
│   ├── automatica/
│   │   ├── mod_1/
│   │   └── mod_2/
│   ├── bdsi/
│   ├── calcolo/
│   │   ├── interpolazione/
│   │   ├── quadratura/
│   │   ├── regressione/
│   │   ├── sistemi_lineari/
│   │   └── zeri_funzione/
│   ├── elettronica/
│   │   ├── analogica/
│   │   └── digitale/
│   ├── elettrotecnica/
│   ├── ottica/
│   ├── so/
│   └── statistica/
├── terzo_anno/
│   ├── altro/
│   ├── automazione/
│   ├── controllo/
│   ├── macchine/
│   ├── machine_learning/
│   │   ├── notebooks/
│   │   ├── project/
│   │   ├── slides/
│   │   └── summary/
│   ├── meccanica/
│   ├── misurazione/
│   │   ├── es_laboratorio/
│   │   ├── es_matlab/
│   │   └── esame/
│   └── telecomunicazioni/
├── altro/
└── tesi/
```

Il file [.gitignore](.gitignore) esclude `primo_anno/java/`, `altro/`, `tesi/`, i dataset del progetto di machine learning e `terzo_anno/macchine/appunti/`. Questi materiali locali non vengono inclusi in un clone della repository.

## 🧠 Contenuti

- **Appunti e dispense:** PDF, formulari, riassunti e documenti Word organizzati per materia.
- **Algoritmi e programmazione:** esercizi in C, C++, Python e SageMath; progetti Java nella cartella locale dedicata.
- **Calcolo e simulazioni:** script MATLAB per metodi numerici, misurazione, controllo e telecomunicazioni.
- **Elettronica:** schemi e simulazioni, automi JFLAP/Mealy ed esercizi per Arduino.
- **Statistica e machine learning:** schede, dati e notebook Jupyter per analisi, classificazione e clustering.
- **Materiale locale:** documenti personali e di tesi nelle cartelle escluse da Git.

## 📘 Trascrizioni LaTeX

Sono disponibili le trascrizioni dei 10 documenti elencati sotto, corrispondenti a **499 pagine dei PDF originali**. L’impaginazione dei PDF compilati può avere un numero diverso di pagine. Le parti dubbie e le incongruenze degli appunti sono segnalate nelle note di trascrizione.

| Materia | Sorgente LaTeX | PDF compilato |
|---|---|---|
| Analisi 1 | [analisi1.tex](primo_anno/analisi/analisi1.tex) | [analisi1_tex.pdf](primo_anno/analisi/analisi1_tex.pdf) |
| Analisi 2 | [analisi2.tex](primo_anno/analisi/analisi2.tex) | [analisi2_tex.pdf](primo_anno/analisi/analisi2_tex.pdf) |
| Economia | [economia.tex](primo_anno/economia/economia.tex) | [economia_tex.pdf](primo_anno/economia/economia_tex.pdf) |
| Fisica | [fisica.tex](primo_anno/fisica/fisica.tex) | [fisica_tex.pdf](primo_anno/fisica/fisica_tex.pdf) |
| Geometria | [geometria.tex](primo_anno/geometria/geometria.tex) | [geometria_tex.pdf](primo_anno/geometria/geometria_tex.pdf) |
| Automatica, modulo 1 | [automatica_mod_1.tex](secondo_anno/automatica/mod_1/automatica_mod_1.tex) | [automatica_mod_1_tex.pdf](secondo_anno/automatica/mod_1/automatica_mod_1_tex.pdf) |
| Calcolo numerico | [calcolo_numerico.tex](secondo_anno/calcolo/calcolo_numerico.tex) | [calcolo_numerico_tex.pdf](secondo_anno/calcolo/calcolo_numerico_tex.pdf) |
| Elettrotecnica | [elettrotecnica.tex](secondo_anno/elettrotecnica/elettrotecnica.tex) | [elettrotecnica_tex.pdf](secondo_anno/elettrotecnica/elettrotecnica_tex.pdf) |
| Ottica | [ottica.tex](secondo_anno/ottica/ottica.tex) | [ottica_tex.pdf](secondo_anno/ottica/ottica_tex.pdf) |
| Statistica | [statistica.tex](secondo_anno/statistica/statistica.tex) | [statistica_tex.pdf](secondo_anno/statistica/statistica_tex.pdf) |

I sorgenti e i PDF compilati si trovano accanto agli originali. Le cartelle `*_tex_assets/` e `elettrotecnica_figure/` contengono capitoli o figure di supporto e vanno mantenute insieme ai rispettivi sorgenti.

L’elenco [pdfs_path_list.txt](pdfs_path_list.txt) contiene anche `meccanica.pdf`, escluso dalla trascrizione: per Meccanica rimane disponibile il documento originale.

### Compilazione

È stato verificato il funzionamento di **`pdflatex`**. Per compilare, entra nella cartella del sorgente e usa `-jobname=<materia>_tex`, così il risultato ha il nome richiesto e il PDF originale viene preservato. Per esempio:

```sh
cd primo_anno/fisica
pdflatex -interaction=nonstopmode -halt-on-error -jobname=fisica_tex fisica.tex
pdflatex -interaction=nonstopmode -halt-on-error -jobname=fisica_tex fisica.tex
```

Le due esecuzioni aggiornano anche eventuali riferimenti interni. I sorgenti che usano `babel` prevedono un’alternativa quando il supporto per la lingua italiana non è installato.

## 🔒 Utilizzo

La repository raccoglie materiale per lo studio e il backup personale. La copia, redistribuzione o pubblicazione richiedono l’autorizzazione dei rispettivi titolari del materiale.

## 👨‍💻 Autore

**Daniele Di Spirito**

Ingegneria Informatica e dell’Automazione – Politecnico di Bari

