<!--next-version-placeholder-->

## v0.2.0 (2024-03-16)

### Feature

* **create-user:** Add user creation script ([`c5cdfd9`](https://github.com/entelecheia/rootfiles/commit/c5cdfd9306b7add25e702cb82e4254108a869d4b))
* **script:** Add script to install Python and manage versions ([`f3ad3be`](https://github.com/entelecheia/rootfiles/commit/f3ad3be110b21fa3fcb4ffb44eeed477c689877e))
* **rootmoi:** Add python installation command to run_once_before00-install-prerequisites ([`e10fce8`](https://github.com/entelecheia/rootfiles/commit/e10fce89ecdc05d1ad18346d42ad8370a383c875))

## v0.1.0 (2024-02-29)

### Feature

* **rootmoi:** Add symlink option for docker image directory ([`366b03a`](https://github.com/entelecheia/rootfiles/commit/366b03adcc0c4e6e0e6cfe06e31ebb8e9c00fd1d))
* **docker-storage:** Add symlink option for docker image directory ([`388722e`](https://github.com/entelecheia/rootfiles/commit/388722ea186ed0bcf9885e30ae4942d1ed3f7bfe))
* **rootmoi:** Add APT package list update before install ([`35deeeb`](https://github.com/entelecheia/rootfiles/commit/35deeeb2bfa9dd5ffd2928c466586dd65e2df655))
* **rootmoi:** Add pass package to .chezmoidata.yaml ([`2de4193`](https://github.com/entelecheia/rootfiles/commit/2de41938c82d742266e0479cf2563ac55602c012))
* **rootmoi:** Add script to create virtual LAN ([`e1d69c0`](https://github.com/entelecheia/rootfiles/commit/e1d69c0229fb67cc857b91192765aabf4262fb17))
* **rootmoi:** Add move docker storage script ([`15337e7`](https://github.com/entelecheia/rootfiles/commit/15337e723b3db75c87c8145a469c9eaaed768337))
* **rootmoi:** Add docker image data location prompt ([`240f2dd`](https://github.com/entelecheia/rootfiles/commit/240f2ddd8fd5a5e00eb33f34e4a42a29e4e31a57))
* **rootmoi:** Add dataspace and docker image configurations ([`4cb02b7`](https://github.com/entelecheia/rootfiles/commit/4cb02b7ae11e0e673f20f7b3aa12d7df60e529f7))
* **rootmoi:** Add python version setting ([`5e2f5ba`](https://github.com/entelecheia/rootfiles/commit/5e2f5ba3fe08a4d445ab7d16ae75b14b65fcbf99))
* **rootmoi:** Add dataspace location in .chez ([`e39144a`](https://github.com/entelecheia/rootfiles/commit/e39144ad35856a3b611302bea4e24e9683c75e6c))
* **rootmoi:** Add dataspace setup script ([`a43be79`](https://github.com/entelecheia/rootfiles/commit/a43be791f06cf91a0a43b871d4d979ed6b3ca285))
* **rootmoi:** Check and install missing packages ([`64b12ee`](https://github.com/entelecheia/rootfiles/commit/64b12ee51a7546b9be859e1fda4e57a632cfbdd3))
* **rootmoi:** Add APT installation for missing packages ([`b1bb4d7`](https://github.com/entelecheia/rootfiles/commit/b1bb4d7ff18a4eba934f99ce2cb1e2d1f3bd2929))
* **rootmoi:** Add interactive python version selection and validation ([`a10922e`](https://github.com/entelecheia/rootfiles/commit/a10922e1d8f99f95bcf73d5ad581c47becb7ee57))
* **rootmoi:** Add Python version selection ([`fe829e2`](https://github.com/entelecheia/rootfiles/commit/fe829e2f2531059176547be86aef3c709d8535ed))
* **chezmoi:** Add scripts for package installation, removal, and upgrade ([`c250e9e`](https://github.com/entelecheia/rootfiles/commit/c250e9e99fa27576418ac98facf26f4efcadf4b0))
* **rootmoi:** Add new yaml file with package definitions ([`77041f9`](https://github.com/entelecheia/rootfiles/commit/77041f90f1acdb0f125c5f8ae004a30ab6365eb8))
* **rootmoi:** Add run_once_00-install-prerequisites.sh.tmpl script ([`dda60f9`](https://github.com/entelecheia/rootfiles/commit/dda60f9c7a26a55b6a7b137f1d37392518fceacd))
* **rootmoi:** Add user creation logic ([`a99c227`](https://github.com/entelecheia/rootfiles/commit/a99c227340b70cad4d70002a9b6ce95e0d624519))
* **rootmoi:** Add support for non-root user configuration ([`8ec79d3`](https://github.com/entelecheia/rootfiles/commit/8ec79d3930df8fe10b965d451c0d17354af9c22a))
* **scripts:** Add new install script ([`5bf273c`](https://github.com/entelecheia/rootfiles/commit/5bf273cdebf693fe6c2832b3d0d69e78975cf4ee))
* Initial commit ([`e78ca8e`](https://github.com/entelecheia/rootfiles/commit/e78ca8e09bc9b8bd31dd165b7835e7ee9b19e38e))

### Fix

* **rootmoi:** Correct syntax error in update command ([`cadd78b`](https://github.com/entelecheia/rootfiles/commit/cadd78b30b02c02452c25b06d27498123f23d97e))
* **rootmoi:** Utilize ubuntu18.04 in .list files for Nvidia container toolkit ([`8149720`](https://github.com/entelecheia/rootfiles/commit/8149720be9056cfb1d47d8a944c2fcc8117ec113))
* **nvidia-container-toolkit:** Update source list line in chezmoidata.yaml ([`cb792a4`](https://github.com/entelecheia/rootfiles/commit/cb792a4b0e5ea91fc2ac77e3dc32fceaaae64efa))
* **rootmoi:** Correct end comment positioning in .chezmoi.yaml.tmpl file ([`f60c156`](https://github.com/entelecheia/rootfiles/commit/f60c1564630ea62a9f0dc39abc3d4648dbb92ec9))
* **docker-storage:** Use recursive copy for docker directory backup ([`810cea3`](https://github.com/entelecheia/rootfiles/commit/810cea3b6ccd3388a6fc28cc3838dbb2afb1ffb9))
