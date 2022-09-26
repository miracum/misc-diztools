# DIZtools NEWS

## Unreleased (2022-09-07)

#### New features

-   added `paste2` function with `collapse_last` argument
    ([144fdf3](https://gitlab.miracum.org/miracum/misc/diztools/tree/144fdf3c2a288e6f8d9a37cd113632f76375184e))
-   added new function `number_to_position()`
    ([50d44ba](https://gitlab.miracum.org/miracum/misc/diztools/tree/50d44bae0603b654cc8a6a3b78599609c490662b))
-   added logo
    ([09c809d](https://gitlab.miracum.org/miracum/misc/diztools/tree/09c809d6d3d6cd531e2d9cd1d413701fa9f85e4d))
-   added function `check_if_unique_rows`
    ([bd648a5](https://gitlab.miracum.org/miracum/misc/diztools/tree/bd648a5975d7bbea615e4b172515cd96a52732db))

#### Bug fixes

-   `is.empty()` can now handle lists in lists
    ([41a2ba7](https://gitlab.miracum.org/miracum/misc/diztools/tree/41a2ba7ed1add31bea23c79d6f0f382cf8a4551f))
-   importing data.table now for check\_if\_unique\_rows
    ([c0f8b69](https://gitlab.miracum.org/miracum/misc/diztools/tree/c0f8b692090a7a40bb50d8024582e891aeb5aea4))
-   feedback function broke after calling `close_all_connections()`
    ([9938688](https://gitlab.miracum.org/miracum/misc/diztools/tree/9938688448a29e3a423d1c0afbb260357cd926c4))

#### Refactorings

-   slightly changed print format output of `get_current_timestamp()`
    ([1d3fa75](https://gitlab.miracum.org/miracum/misc/diztools/tree/1d3fa75728c2398619236b4a16ebf1a4c8d505f2))

#### Tests

-   added test for `paste2`
    ([746e86d](https://gitlab.miracum.org/miracum/misc/diztools/tree/746e86df47c42f6381b8eee35684cf7a5fa57eb4))

#### CI

-   exclusion to fix lintin errors
    ([197b3ae](https://gitlab.miracum.org/miracum/misc/diztools/tree/197b3aeec6e9a504350ab209aff5366d694d6c00))
-   removed gitlab-ci since github actions work
    ([eaed18c](https://gitlab.miracum.org/miracum/misc/diztools/tree/eaed18ce4acf27abb918a53d8798bcf30ee614f3))
-   added deps for devtools
    ([9da97d8](https://gitlab.miracum.org/miracum/misc/diztools/tree/9da97d8a298c2efb471bce34cf9d80b303b26457))
-   updated gha
    ([d2bd984](https://gitlab.miracum.org/miracum/misc/diztools/tree/d2bd9847acef9e3ee02ae202ff0e23748d35fa84))
-   updated gha
    ([808bafc](https://gitlab.miracum.org/miracum/misc/diztools/tree/808bafcc3c31ecf06b47b090f582a3a9459e0c65))

#### Docs

-   added default arguments from `paste` also to `paste2`
    ([6886525](https://gitlab.miracum.org/miracum/misc/diztools/tree/688652517403ba3860760dea565109c9bbabb8af))
-   updated news.md
    ([25af516](https://gitlab.miracum.org/miracum/misc/diztools/tree/25af5163f282d1bcc01e573020904a921be30596))
-   updated news
    ([bd90fea](https://gitlab.miracum.org/miracum/misc/diztools/tree/bd90fea1b1605dcd4733108bc55781958edbcc24))
-   added default parameter for stop
    ([784a99e](https://gitlab.miracum.org/miracum/misc/diztools/tree/784a99ee041a3af61ab29abdba7bcaf131509166))
-   updated news
    ([85ffca4](https://gitlab.miracum.org/miracum/misc/diztools/tree/85ffca4330fb28ddb8752ddb551ce9ceb5f5e4cc))

#### Other changes

-   updated news.md
    ([733844b](https://gitlab.miracum.org/miracum/misc/diztools/tree/733844b0485b6b4fdc95bd34411d513bd4b98e90))
-   news.md now with autonewsmd package
    ([dd9b728](https://gitlab.miracum.org/miracum/misc/diztools/tree/dd9b728fcbd1ccf99da6d4c9fbac0164636435d4))
-   added reference to SO for pattern
    ([c0c3435](https://gitlab.miracum.org/miracum/misc/diztools/tree/c0c3435d6a0feaec4b313ea25cfa09706b137f01))
-   new dev version
    ([1106ff6](https://gitlab.miracum.org/miracum/misc/diztools/tree/1106ff6ce31297ec014c8aa45d31273a291fc38d))
-   new release `v0.0.5`
    ([0aa2060](https://gitlab.miracum.org/miracum/misc/diztools/tree/0aa2060d445db21e559d825c039705f2dd0c27ab))
-   updated news.md
    ([9bc5a61](https://gitlab.miracum.org/miracum/misc/diztools/tree/9bc5a61a845fa4ecef196ca2e625e67979834de6))
-   comment out logo creation to have png-file not altered at every
    devstuffs run
    ([1152dbd](https://gitlab.miracum.org/miracum/misc/diztools/tree/1152dbd04046d68993414618ea1b13f185866fdf))
-   updated logo
    ([842364c](https://gitlab.miracum.org/miracum/misc/diztools/tree/842364ca5d56247f02b160c5148018333ced6ba0))
-   added rplots.pdf to rbuildignore
    ([17dc982](https://gitlab.miracum.org/miracum/misc/diztools/tree/17dc982ab1559b6d26b793f0482bd02676f1e8af))
-   updated news.md
    ([799b2db](https://gitlab.miracum.org/miracum/misc/diztools/tree/799b2db4778670d1432bb120ad78ec4c4220d6f1))
-   merged origin/dev
    ([f527fde](https://gitlab.miracum.org/miracum/misc/diztools/tree/f527fdeb51d647d4b50b499b77d415e7866176a7))
-   updated devstuffs to get auto-changelog working again
    ([bade22c](https://gitlab.miracum.org/miracum/misc/diztools/tree/bade22cab4e2778bd528cf036f9fa4cd7e7aa2f5))
-   removed console print in case of new logfile
    ([029f0b1](https://gitlab.miracum.org/miracum/misc/diztools/tree/029f0b1c3fca557be25d69a96b81099dd036eb19))
-   added `print_invalid_rows` logic to function `check_if_unique_rows`
    ([fec7c0b](https://gitlab.miracum.org/miracum/misc/diztools/tree/fec7c0b6a07f7aa36e2bc9cf90d4e08466cc235c))
-   updated news md
    ([c40e2fb](https://gitlab.miracum.org/miracum/misc/diztools/tree/c40e2fb7828a5b6bbb5053f16bdf748654e07d65))

Full set of changes:
[`v0.0.4...733844b`](https://gitlab.miracum.org/miracum/misc/diztools/compare/v0.0.4...733844b)

## v0.0.4 (2022-03-03)

#### New features

-   added `trim.space()` and `vgsub()` as functions
    ([6376a9a](https://gitlab.miracum.org/miracum/misc/diztools/tree/6376a9a5bfc6756ac1a20ff445eedba79d6d1a4d))
-   added `is.empty()` function
    ([a241b68](https://gitlab.miracum.org/miracum/misc/diztools/tree/a241b68c1f3eb99709d3d18ef2181bf1166e9e5e))

#### Bug fixes

-   global option now work for feedback
    ([0042835](https://gitlab.miracum.org/miracum/misc/diztools/tree/0042835a4dcff8bec58d05f5c87e441f66beae83))

#### CI

-   updated http –&gt; https
    ([2c321ed](https://gitlab.miracum.org/miracum/misc/diztools/tree/2c321ed1bd41598b219afdb4a0b99e0e5078fd98))

#### Docs

-   updated news.md
    ([9246684](https://gitlab.miracum.org/miracum/misc/diztools/tree/924668420f9099b911ab0ac8f6c861e905e74621))
-   updated news.md
    ([fce9ddf](https://gitlab.miracum.org/miracum/misc/diztools/tree/fce9ddf635de801830ff9cc09cd4f49bfffebecd))

#### Other changes

-   new release 0.0.4
    ([9661f74](https://gitlab.miracum.org/miracum/misc/diztools/tree/9661f7465fd23c5fb3b89539970f8707c3b203ab))

Full set of changes:
[`v0.0.3...v0.0.4`](https://gitlab.miracum.org/miracum/misc/diztools/compare/v0.0.3...v0.0.4)

## v0.0.3 (2022-02-24)

#### Refactorings

-   moved function `clear()` to new package `cleaR::clear()`
    ([5600cd8](https://gitlab.miracum.org/miracum/misc/diztools/tree/5600cd8e00a61fe4a1b4ceb2a35f4da84362d06f))

#### Docs

-   added badges to readme again
    ([d935b3d](https://gitlab.miracum.org/miracum/misc/diztools/tree/d935b3d3cab26e20d7d6fa75ee42feaef4678d0a))

#### Other changes

-   prep for cran release 0.0.3
    ([c522b39](https://gitlab.miracum.org/miracum/misc/diztools/tree/c522b3970602ff1dd486db906531dc95c42ae5e3))
-   updated readme, added examples
    ([cda09ba](https://gitlab.miracum.org/miracum/misc/diztools/tree/cda09baf9e149901e0a82c149a5138690581d0a1))
-   merged dev
    ([a247e7e](https://gitlab.miracum.org/miracum/misc/diztools/tree/a247e7e09e023aa2d142c8f82439ee4535a2043c))

Full set of changes:
[`v0.0.2...v0.0.3`](https://gitlab.miracum.org/miracum/misc/diztools/compare/v0.0.2...v0.0.3)

## v0.0.2 (2022-02-08)

#### Other changes

-   cran version
    ([ccc3382](https://gitlab.miracum.org/miracum/misc/diztools/tree/ccc33824fa3f6f0f2312a14aaee16efa24570b96))
-   added files to rbuildignore
    ([64ff26e](https://gitlab.miracum.org/miracum/misc/diztools/tree/64ff26e8570f2464959def7f2795b9ec15888926))

Full set of changes:
[`v0.0.1...v0.0.2`](https://gitlab.miracum.org/miracum/misc/diztools/compare/v0.0.1...v0.0.2)

## v0.0.1 (2022-02-07)

#### New features

-   added `logger` for console logging
    ([6bfdc1d](https://gitlab.miracum.org/miracum/misc/diztools/tree/6bfdc1d4958b1c1e96b1fb43701e2a16657fe0f5))
-   added normalizepath to file.path calls
    ([d201fd9](https://gitlab.miracum.org/miracum/misc/diztools/tree/d201fd957738ce60f2f59680bf358caf552440f9))
-   added option support for `feedback` function
    ([6435e41](https://gitlab.miracum.org/miracum/misc/diztools/tree/6435e41918b163d2f5b566ffa66e226ed71b241b))

#### Bug fixes

-   example errors and cran check corrections
    ([7deca15](https://gitlab.miracum.org/miracum/misc/diztools/tree/7deca15fddb203a0776f0328d396e32c69fa73eb))
-   mustwork=FALSE to clean\_path
    ([bee0484](https://gitlab.miracum.org/miracum/misc/diztools/tree/bee0484d69403eb619ac980226da93915593360d))
-   fixed some missing docs; cran checks should work now
    ([66150e9](https://gitlab.miracum.org/miracum/misc/diztools/tree/66150e92c39e02485b619a6ba3d4c4c7a701d2ca))

#### Refactorings

-   reverted to `feedback` instead of `log` (log is the logarithm
    :facepalm:
    ([ef6024f](https://gitlab.miracum.org/miracum/misc/diztools/tree/ef6024f62355d9032371b812183c94195852c5e5))
-   changed `feedback()` to `log()`
    ([6e85d26](https://gitlab.miracum.org/miracum/misc/diztools/tree/6e85d265a486226ec63bc2dfeacd99730c315b1e))

#### Tests

-   moved unit tests for logging to diztools
    ([0819da6](https://gitlab.miracum.org/miracum/misc/diztools/tree/0819da6cfbd505e3f1807c75d1e43fa58c32a14e))

#### Docs

-   updated spelling
    ([f5c9143](https://gitlab.miracum.org/miracum/misc/diztools/tree/f5c9143e18b46ffa7e79084bfb945f825b328e35))
-   updated news.md
    ([e8f923b](https://gitlab.miracum.org/miracum/misc/diztools/tree/e8f923b85cc7e625ffda6977aa758bd75caf91c8))
-   updated rep2 function which was ahead in dizutils
    ([8c62eca](https://gitlab.miracum.org/miracum/misc/diztools/tree/8c62eca249ca7a15124c70f5ef9f2bb921408265))

#### Other changes

-   first cran submission
    ([dd3ec38](https://gitlab.miracum.org/miracum/misc/diztools/tree/dd3ec389e9a05f5766da6f84a4a94b3be9d132a0))
-   added re-creation of gitignore and buildignore
    ([8f8e7ab](https://gitlab.miracum.org/miracum/misc/diztools/tree/8f8e7ab7bcd5dc38f8cba5d4f71048dd7bc7cb00))
-   added reference to logger in feedback function info
    ([660c6db](https://gitlab.miracum.org/miracum/misc/diztools/tree/660c6dbb5caa386897b48b0290b7556cb7da15c0))
-   updated all `feedback` references to `log`
    ([7fb1436](https://gitlab.miracum.org/miracum/misc/diztools/tree/7fb1436288ffee98828731f296e5c30b7d93768d))
-   removed unnecessary dependency to rapportools
    ([f5835a8](https://gitlab.miracum.org/miracum/misc/diztools/tree/f5835a8d2cf2ae67d8c1a30dbf28611206a508ae))
-   added mustwork-arg to normalizepath
    ([3e8f829](https://gitlab.miracum.org/miracum/misc/diztools/tree/3e8f8297b89d168aa75ae4f2112ac21ac2e27563))
-   enhancements to clean-path and log
    ([08e82ce](https://gitlab.miracum.org/miracum/misc/diztools/tree/08e82cee2c26a1eb7287a14fa20e42f190cc6007))
-   added rapportools dependency; fixed śome linting errors
    ([cd3207d](https://gitlab.miracum.org/miracum/misc/diztools/tree/cd3207d8ca30ec089d01daf81312668907d70592))
-   fixed typo in example caused failing tests
    ([e40470b](https://gitlab.miracum.org/miracum/misc/diztools/tree/e40470b92bee43b24c6adb9bf8ca5f3265acf407))
-   working on migrating logging functions; fixing errors with
    normalizepath
    ([ca27ddb](https://gitlab.miracum.org/miracum/misc/diztools/tree/ca27ddb8ae8f6148b757beaffa68131879fc3504))
-   updated readme badge urls
    ([2226ef2](https://gitlab.miracum.org/miracum/misc/diztools/tree/2226ef2be5b7e6b6a67ef6a356a05f275c093f2a))
-   shiny, shinyjs to suggests; removed call to installed.packages
    ([04b22c0](https://gitlab.miracum.org/miracum/misc/diztools/tree/04b22c0fcb4231576f7c6baa1121d5da3b1f3d13))
-   updated news.md
    ([bbdcaa6](https://gitlab.miracum.org/miracum/misc/diztools/tree/bbdcaa652533c14c0df588d826905ec02a83941b))
-   updated licence statements
    ([0dec35e](https://gitlab.miracum.org/miracum/misc/diztools/tree/0dec35ea45edf45a425d9eea47d5eb9018051b25))
-   towards sufficient cran checks
    ([c6907e5](https://gitlab.miracum.org/miracum/misc/diztools/tree/c6907e51e1cefaaa981237889c76d4107bf68980))
-   first attempt for new package. Testing pending
    ([16d8048](https://gitlab.miracum.org/miracum/misc/diztools/tree/16d8048360ec3f90ad6630b99acc225a700cc91e))
-   first commit
    ([6aa0e50](https://gitlab.miracum.org/miracum/misc/diztools/tree/6aa0e5086d602f236abaff33906cd433db8c1519))

Full set of changes:
[`6aa0e50...v0.0.1`](https://gitlab.miracum.org/miracum/misc/diztools/compare/6aa0e50...v0.0.1)
