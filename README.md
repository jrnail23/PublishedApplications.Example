PublishedApplications.Example
=============================

Quick example to show a particular failure scenario when using [PublishedApplications](https://github.com/ferventcoder/nugetpackages):
Content marked "Copy to Output Directory" contained in a folder (LibraryB/MyContent/MyFile.txt) in a referenced assembly will be copied to the root folder of the targeted _PublishedApplication (i.e., _PublishedApplications/MyApp/MyFile.txt) instead of the containing folder (_PublishedApplications/MyApp/MyContent/MyFile.txt)



Requires [PSake](https://github.com/psake/psake)

Open a command prompt at source root, enter psake... test should run.
