### About ###
smali/baksmali is an assembler/disassembler for the dex format used by dalvik, Android's Java VM implementation. The syntax is loosely based on Jasmin's/dedexer's syntax, and supports the full functionality of the dex format (annotations, debug info, line info, etc.)

The names "smali" and "baksmali" are the Icelandic equivalents of "assembler" and "disassembler" respectively. Why Icelandic you ask? Because dalvik was named for an Icelandic fishing village.

Curious what the smali format looks like? Here's a quick [HelloWorld example](https://github.com/JesusFreke/smali/blob/master/examples/HelloWorld/HelloWorld.smali) to whet your appetite.

<i><h2>Got questions/comments? Need help? Come hang out in <a href='http://webchat.freenode.net/?channels=smali'>#smali</a> on freenode.</h2></i>

### News ###
**2021-03-02** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.5.2.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.5.2.jar) [v2.5.2](https://github.com/JesusFreke/smali/tree/v2.5.2) is out.
* [Fixes an issue](https://github.com/JesusFreke/smali/issues/805) where some character encoded values were disassembled incorrectly.
* baksmali and smali now depend on dexlib2 via an api dependency (Thanks to [Lanchon](https://github.com/Lanchon) for [pointing this out](https://github.com/JesusFreke/smali/commit/53b52f023d7d041738bb58ac181901234a2bd5f5#r47777105))
* [Changes](https://github.com/JesusFreke/smali/commits/v2.5.2)

**2021-03-02** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.5.1.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.5.1.jar) [v2.5.1](https://github.com/JesusFreke/smali/tree/v2.5.1) is out.
* [Fixes an issue](https://github.com/JesusFreke/smali/pull/804) when running smali with a java 6-8 jdk (Thanks [iBotPeaches](https://github.com/iBotPeaches)!)
* [Changes](https://github.com/JesusFreke/smali/commits/v2.5.1)

**2021-03-01** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.5.0.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.5.0.jar) [v2.5.0](https://github.com/JesusFreke/smali/tree/v2.5.0) is out.
* Adds support for the additional `test-api` hidden restriction api flag added in Android 11
* Adds support for disassembling dex files that have identifiers with spaces, using the backtick syntax: `` `identifier with spaces` ``
  * Support for this was previously added to smali and the smali language, but the disassembly part of the equation hadn't been implemented yet.
  * This introduces the new [DexFormatter](https://github.com/JesusFreke/smali/blob/master/dexlib2/src/main/java/org/jf/dexlib2/formatter/DexFormatter.java) and [DexFormattedWriter](https://github.com/JesusFreke/smali/blob/master/dexlib2/src/main/java/org/jf/dexlib2/formatter/DexFormattedWriter.java) classes in dexlib2, and deprecates the old ReferenceUtil and EncodedValueUtils classes.
  * This also introduces the new [BaksmaliFormatter](https://github.com/JesusFreke/smali/blob/master/baksmali/src/main/java/org/jf/baksmali/formatter/BaksmaliFormatter.java) and [BaksmaliWriter](https://github.com/JesusFreke/smali/blob/master/baksmali/src/main/java/org/jf/baksmali/formatter/BaksmaliWriter.java) classes in baksmali, which replaces some older classes that have now been removed.
    * All the [Renderer/*Renderer](https://github.com/JesusFreke/smali/tree/9ce00aae9c2d662f2a1e27990f82ca945b35488e/baksmali/src/main/java/org/jf/baksmali/Renderers) classes are removed
    * The [ReferenceFormatter](https://github.com/JesusFreke/smali/blob/9ce00aae9c2d662f2a1e27990f82ca945b35488e/baksmali/src/main/java/org/jf/baksmali/Adaptors/ReferenceFormatter.java) class is removed
    * The [EncodedValueAdapter](https://github.com/JesusFreke/smali/blob/9ce00aae9c2d662f2a1e27990f82ca945b35488e/baksmali/src/main/java/org/jf/baksmali/Adaptors/EncodedValue/EncodedValueAdaptor.java) and [related classes](https://github.com/JesusFreke/smali/tree/9ce00aae9c2d662f2a1e27990f82ca945b35488e/baksmali/src/main/java/org/jf/baksmali/Adaptors/EncodedValue) are removed
  * [BaksmaliWriter](https://github.com/JesusFreke/smali/blob/master/baksmali/src/main/java/org/jf/baksmali/formatter/BaksmaliWriter.java) is now the main output writer that is passed around everywhere in baksmali, instead of [IndentingWriter](https://github.com/JesusFreke/smali/blob/master/dexlib2/src/main/java/org/jf/util/IndentingWriter.java).
* Fixed [a bug on mac](https://github.com/JesusFreke/smali/pull/789) where some unicode characters in file paths are treated as the same character (Thanks to [tlundeen](https://github.com/tlundeen) for reporting and submitting an initial fix -- even though I ended up not using it :))
* A number of updates to the gradle build, to fix some deprecations and add support for compiling with a java 11 jdk
* [Changes](https://github.com/JesusFreke/smali/commits/v2.5.0)

**2020-02-05** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.4.0.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.4.0.jar) v2.4.0 is out.
* Adds support for the new hidden restriction api flags introduced for framework dex files in Android 10
  * This includes a backwards-incompatible change to the [Method](https://github.com/JesusFreke/smali/blob/v2.4.0/dexlib2/src/main/java/org/jf/dexlib2/iface/Method.java) and [Field](https://github.com/JesusFreke/smali/blob/v2.4.0/dexlib2/src/main/java/org/jf/dexlib2/iface/Field.java) interfaces, which now have a new getHiddenApiRestrictions method.
* Several small fixes and improvements to the rewriter functionality
  * Thanks to [Lanchon](https://github.com/Lanchon) for the bug reports/suggestions!
  * This includes a [backwards-incompatible change](https://github.com/JesusFreke/smali/commit/12b95235e3ccf4e71243b728e7e168c34397fbc3) to move the DexFile rewriter from [DexRewriter](https://github.com/JesusFreke/smali/blob/v2.4.0/dexlib2/src/main/java/org/jf/dexlib2/rewriter/DexRewriter.java) to the [RewriterModule](https://github.com/JesusFreke/smali/blob/v2.4.0/dexlib2/src/main/java/org/jf/dexlib2/rewriter/RewriterModule.java), for consistency will all the other rewriters.
* Added a new [DexBackedDexFile constructor](https://github.com/JesusFreke/smali/commit/b7a1052c66edecb864ce3db7d1b85453594ae9a3) that accepts a DexBuffer. Thanks [huaxin-gg](https://github.com/Huaxin-gg)!
* [Changes](https://github.com/JesusFreke/smali/commits/v2.4.0)

**2019-09-19** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.3.3.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.3.3.jar) v2.3.3 is out.
* This fixes a [severe parsing issue](https://github.com/JesusFreke/smali/issues/725) in smali
* [Changes](https://github.com/JesusFreke/smali/commits/v2.3.3)

**2019-09-17** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.3.2.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.3.2.jar) v2.3.2 is out.
* Added support for new quoted syntax for class and member names, which allows for spaces in these names
  - Support for member/class names with spaces is being added in the next dex version/api level
  - e.g. ``Lmy/class;->`member name with spaces`()V`` or ``Lmy/`class with spaces`;``
  - The new quote syntax can be used anywhere, but spaces are only allowed when assembling with api level 30 or higher (note: api 30 is a placeholder for whatever api level the new dex format gets released in -- which will likely end up being api 30)
* Rework the array payload element width checks to properly handle all cases
* [Changes](https://github.com/JesusFreke/smali/commits/v2.3.2)

**2019-08-29** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.3.1.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.3.1.jar) v2.3.1 is out.
* Fix an issue with array payload width validation, thanks to [melkonyan](https://github.com/melkonyan)
* Some minor api changes in DexBackedDexFile, to use the DexBacked-specific type for some sections
* Gracefully handle a corner case involving array payload instructions with element width of 0
* Improved some error messages related to finding embedded dex files in an oat file
* Switched some lambdas to anonymous inner classes, to resolve some issues when running on Android P
* Fixed an issue parsing method handle references
* [Changes](https://github.com/JesusFreke/smali/commits/v2.3.1)

**2019-08-07** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.3.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.3.jar) v2.3 is out.
* This release adds support for the new cdex file format in Android P, and a few other changes required to support deodexing Android P images.
* The were a few breaking changes in dexlib2's api. e.g.
  - MultiDexContainer was changed a bit, with a new DexEntry structure that is separate from the dex file it contains.
  - The indexed item specific methods in DexBackedDexFile were generalized into an IndexedSection object for each type of indexed item
  - Probably a couple of others.
* Added support for 45cc and 4rcc immutable instruction (thanks [aki-ks](https://github.com/aki-ks)!)
* [Changes](https://github.com/JesusFreke/smali/commits/v2.3)

**2019-04-04** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.2.7.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.2.7.jar) v2.2.7 is out.
* This is a small bugfix release for a [specific issue](https://github.com/JesusFreke/smali/commit/0d4443a19a591c506a4e9214f96003da210e2d86).
* [Changes](https://github.com/JesusFreke/smali/commits/v2.2.7)

**2019-01-23** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.2.6.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.2.6.jar) v2.2.6 is out
* [Changes](https://github.com/JesusFreke/smali/commits/v2.2.6)


**2018-08-28** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.2.5.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.2.5.jar) v2.2.5 is out
* Support for 8.1 oat files, thanks to [Albert Gorski](https://github.com/agorski3)
* Multiple API improvements and bugfixes, thanks to [Lanchon](https://github.com/lanchon)
* Restructing of most util classes from util module to dexlib2 module
  * The util module is now mostly for utilities needed by both smali/baksmali, but aren't necessarily relevant to someone who is linking against just the dexlib2 library. E.g. command line parsing utilities, etc.
* A fix for how 45cc instructions (invoke-polymorphic) are parsed, thanks to [Albert Gorski](https://github.com/agorski3)
* Added support for missing method handle types, thanks to [Albert Gorski](https://github.com/agorski3)
* Some code cleanup, thanks to [A4Vision](https://github.com/A4Vision)


**2018-06-12** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.2.4.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.2.4.jar) v2.2.4 is out. This version
adds support for dex versions 037, 038 and 039


**2017-10-30** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.2.2.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.2.2.jar) v2.2.2 is out. This is a minor
bugfix release.

**2017-05-23** [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.2.1.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.2.1.jar) v2.2.1 is out. This version adds support for deodexing O system images that use vdex files, and has a few other minor improvements and bug fixes.

**2017-03-31** [smalidea v0.05](https://bitbucket.org/JesusFreke/smali/downloads/smalidea-0.05.zip) is out. This version fixes an issue that prevented watches on registers from working in methods with switch statements.

**2017-03-22** 
* [smali](https://bitbucket.org/JesusFreke/smali/downloads/smali-2.2.0.jar)/[baksmali](https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.2.0.jar) v2.2.0 is out, which is the first non-beta release of the new v2.2 stuff. This version contains significant changes to the command line interface, so be sure to read `smali help`/`baksmali help`, and take a look at [the wiki page](https://github.com/JesusFreke/smali/wiki/SmaliBaksmali2.2)
* [smalidea v0.04](https://bitbucket.org/JesusFreke/smali/downloads/smalidea-0.04.zip) is out. It has a few bug fixes, and most importantly, works with recent versions of IDEA.

**2016-10-16** v2.2b4 is out, which fixes a few remaining issues in 2.2

**2016-10-03** v2.2b3 is out, which fixes some issues related to proguard and jcommander not getting along with each other.

**2016-10-02** v2.2b1 is out!
* A completely new CLI
* Support for N deodexing
* This is a beta release. If you see something wonky or not working, [file bugs](https://github.com/JesusFreke/smali/issues)!
* More info on the [wiki page for v2.2](https://github.com/JesusFreke/smali/wiki/SmaliBaksmali2.2)

**2016-07-16** v2.1.3 is out. This is another minor bugfix version.

**2016-04-08** v2.1.2 is out. This has a few bugfixes, and adds initial support for the new "037" dex format, courtesy of Alex Light.

**2016-01-10** v2.1.1 is out! This adds support for deodexing 64 bit oat files, as well as some fixes for a few other deodexing issues.

**2015-09-30** v2.1.0 is out! This adds support for deodexing Art oat files from Marshmallow+ devices. See [DeodexInstructions](https://github.com/JesusFreke/smali/wiki/DeodexInstructions) for more info.

**2015-09-24** v2.0.8 is out! This is a bugfix release.

**2015-04-30** v2.0.6 is out! Bugfixes, etc.
* Fixes a bug with parameter annotations (credit: Jiri Hrushka)
* Improves the build experience when dx is not on path
* baksmali should be working correctly on windows 8.1 now
* Fixes for the deodexerant makefile (credit: Victor Kaiser-Pendergrast)
* Various other bugfixes, etc. (thanks to Rover12421 for a handful of small fixes)

**2015-01-20** v2.0.5 is out! It fixes a multi-threading issue in baksmali in 2.0.4, and it switches the default for implicit references to no-implicit-references, for better backwards compatibility.

**2015-01-20** The v2.0.4 release is faulty. The download has been removed, and a fixed v2.0.5 will be released shortly.

**2015-01-20** v2.0.4 is out
  * Added optional functionality to add the resource name as a comment to likely resource accesses. See the help for the new -i/--resource-id-files option (credit: Jeff Smith/whydoubt)
  * Added comments for constants that are likely an encoded float/double (credit: Jeff Smith/whydoubt)
  * Added support for implicit method/field references within a class, which allows you to leave off the class name when referencing a field/method within the current class.
  * Changed short option for --check-package-private-access to -k (from -K) (thanks to yyjdelete for noticing/reporting a problem with an interim change related to this)
  * Added the ability to disassemble a file other than classes.dex within an apk (credit: Connor Tumbleson/iBotPeaches)
  * other misc bugfixes, etc.

**2014-01-17** v2.0.3 is out
  * More bugs being slaughtered in this release. Notably, smali's memory footprint should now be reduced, although it's still a good idea to use -JXmx512m when using multiple threads.
  * We also managed to sneak in some new features as well. Thanks to [whydoubt](https://github.com/whydoubt), it's now possible to add a comment with the resource name when a resource id is referenced in the bytecode as a constant, using the new -i flag.
  * As a reminder, the googlecode downloads are deprecated and downloads are now hosted at [bitbucket](https://bitbucket.org/JesusFreke/smali/downloads)

**11-10-13** v2.0.2. Bugs are dead. Long live bugs.

**10-10-13** v2.0. 2.0 is finally out of beta and ready for mass consumption. Consume away!

**Administrivia:**
  * The primary download location has been moved to [bitbucket](https://bitbucket.org/JesusFreke/smali/downloads), per the impending deprecation of downloads on googlecode.
  * The dexlib\_redesign branch in the repository has been merged into the master branch, and the dexlib\_redesign branch itself is dead.
  * The old dexlib library is now gone from the repository, in favor of the new dexlib2 library.
  * The old master branch is available as the [v1.4.3 tag](https://code.google.com/p/smali/source/browse/?name=v1.4.3) - there was never an actual 1.4.3 release, but it contains a few changes that occurred on the master branch after the 1.4.2 release.
A big thanks goes out to Izzat "TwoSheds" Bahadirov for significant effort in helping me out with the dexlib2 redesign, and to all the people who helped test and reported bugs for the 2.0 beta.


**9-14-13** v2.0b6. This version has some significant reworking of how instruction rewriting is handled, as well as various other bug fixes. For people using dexlib2 directly, you'll want to take note of the new MethodImplementationBuilder and/or MutableMethodImplementation classes, which should help streamline creating new method implementations, or modifying existing method implementations.

**6-15-13** v2.0b5, now with 34.2% more bug fixes! Downloads: [smali](https://code.google.com/p/smali/downloads/detail?name=smali-2.0b5.jar)/[baksmali](https://code.google.com/p/smali/downloads/detail?name=baksmali-2.0b5.jar)

**5-12-13** v2.0b4, which fixes some new issues introduced in b3.

**5-12-13** A new 2.0b3 release, which adds multithreading for baksmali.

**5-7-13** A minor update to the beta (v2.0b2), that fixes a reported dexodexing issue.

**5-7-13** A beta release (v2.0b1) is available for the next major of smali/baksmali. You can find more info on the [wiki page](https://code.google.com/p/smali/wiki/SmaliBaksmali20). Feel free to grab the beta jars from the downloads page and give it a spin. Something doesn't work? Please file a [bug report](https://code.google.com/p/smali/issues/list)!

**2-14-13** smali/baksmali v1.4.2 is out, with a handful of bugfixes.

**11-19-12** smali/baksmali v1.4.1 is out. This is mostly just a bugfix release, although
it does include support for a minor change in the way odex files are generated in api 17.

**9-16-12** smali/baksmali v1.4.0 is out! The primary feature in this release is that deodexing has been much simplified. This has actually been implemented for a month or two, but I'm just now getting around to doing a release. See the [deodex instructions](http://code.google.com/p/smali/wiki/DeodexInstructions) for additional information. Additionally, for the developers out there, you'll notice that the mvn build has been replaced with a gradle build. The [build instructions](http://code.google.com/p/smali/wiki/BuildProcedure) have been updated accordingly.

**6-20-12** smali/baksmali v1.3.3 is out. cleanup, bugfixes, more cleanup. Did I mention cleanup?

**1-11-12** smali/baksmali v1.3.2 is out. This version has a few misc. bugfixes

**11-20-11** smali/baksmali v1.3.0 is out! This version now supports Honeycomb and Ice Cream Sandwich. More details [here](http://blog.jesusfreke.com/2011/11/smalibaksmali-130.html).<br><font size='3'><b><i>Important</i></b></font> When deodexing pre-ICS odex files, you must use the new --api-level/-a option to specify the api level<br>
<br>
<b>8-22-11</b> smali/baksmali v1.2.8 is out. This fixes a problematic bug that crept into 1.2.7<br>
<br>
<b>8-13-11</b> smali/baksmali v1.2.7 is out. This is a bugfix release, with a small additional feature (helper comments for synthetic access methods)<br>
<br>
<b>12-23-10</b> smali/baksmali v1.2.6 is out, with support for gingerbread odex files<br>
<br>
<b>10-31-10</b> smali/baksmali v1.2.5 is out. This is a minor release with a few small bugfixes<br>
<br>
<b>8-1-10</b> smali/baksmali v1.2.4 is out, with a number of bugfixes <a href='http://jf.andblogs.net/2010/08/01/more-smalibaksmali-bugfixes/'>blog post</a>

<b>6-13-10</b> smali/baksmali v1.2.3, now with frozen yogurt! <a href='http://jf.andblogs.net/2010/06/13/yes-i-would-like-some-frozen-yogurt-with-my-baksmali-please/'>blog post</a>

<b>4-03-10</b> smali/baksmali v1.2.2 is out! This is again mostly a bugfix release, but it also has significant performance improvements as well. More details <a href='http://jf.andblogs.net/2010/04/03/yabbfr/'>here</a>

<b>3-06-10</b> smali/baksmali v1.2.1 is out! This is mostly a bugfix release, with a few performance improvements and enhancements.<br>
<br>
<b>2-22-10</b> smali/baksmali v1.2 is out! As usual, more info on <a href='http://jf.andblogs.net/2010/02/22/smali-baksmali-1-2-released/'>my blog</a>

<b>12-25-09</b> smali/baksmali v1.1 is out. More info on <a href='http://jf.andblogs.net/2009/12/25/have-a-very-smali-christmas/'>my blog</a>

<b>11-08-09</b> smali/baksmali v1.0 is out. More info on <a href='http://jf.andblogs.net/2009/11/08/smalibaksmali-v1-0/'>my blog</a>

<b>9-10-09</b> smali/baksmali v0.96 is out. baksmali now supports deodexing .odex files! For the first time you can turn those pesky .odex files into much-easier-to-use classes.dex files. Here are <a href='http://code.google.com/p/smali/wiki/DeodexInstructions'>instructions</a> on how this magic is performed.<br>
<br>
<b>NOTE</b> deodexerant is just a helper binary that runs on the phone and talks to baksmali. It doesn't do much of anything interesting in and of itself. Unless you want to dump some vtables or something :)<br>
<br>
<b>8-29-09</b> smali/baksmali v0.95 is out. The major change in this version is a re-implemented version of dexlib, as well as changes in smali/baksmali to work with the new dexlib. Also, I've optimized baksmali, so it should run much much quicker now (up to 4x quicker). smali should also be a bit quicker, but nothing you'll probably notice.<br>
<br>
As far as new functionality goes, baksmali will now output registers that are mapped to method parameters using a p<code>&lt;n&gt;</code> syntax, instead of the normal v<code>&lt;n&gt;</code> syntax. i.e. p0 is the first method parameter (or the "this" reference, for non-static methods), p1 is the second method parameter and so on. If you want to disable this functionality, you can use the -p command line arg.<br>
<br>
<br>
<b>7-27-09</b> smali/baksmali v0.94 is available. This is a bugfix release, a few typo fixes here and there, plus it should be compatible with java 5 now (for the Mac users out there)<br>
<br>
<b>7-3-09</b> baksmali v0.93 is available on the download tab. v0.92 had a template issue that prevented it from running.<br>
<br>
<br>
<b>7-2-09</b> smali/baksmali v0.92 has been released. This is a minor bugfix release. Thanks to Stericson and Josef Pfleger for the bug reports!<br>
<br>
<br>
<b>6-23-09</b> The first release of baksmali (v0.91) is out! Also, a new version of smali, also v0.91, with a number of improvements and fixes. Still no documentation.. I'll get there eventually.<br>
<br>
<br>
<b>6-7-09</b> After lots and lots of work, the first release of smali is out finally! You can grab it from the downloads tab. I'll try and get a wiki going with some documentation, as far as usage and syntax goes. For now, you can look at the examples and tests to see the syntax. There are tests for every opcode, so you should be able to find the syntax you need.<br>
<br>
<b>6-3-09</b> I've been whipping smali into shape the past few days. I should be getting close to a release soon! Currently, it should be able to handle all the features supported by the dex format. I still need to spend some time with the error handling, move all the tests from HelloWorld2.smali to the new junit-tests testing framework, and write more examples.<br>
<br>
<br>
<b>5-9-09</b> I've just added support for packed-switch and sparse-switch, and now smali supports the full set of dex opcodes. Woot! There's still a decent amount of work to be done though. I need to implement try blocks, annotations, debug/line info, add better exception handling in the parsing code, write a real front end, etc.<br>
<br>
<br>
<br>
<h3>More</h3>
To see some examples of the syntax, take a look at <a href='http://code.google.com/p/smali/source/browse/#git%2Fexamples'>examples</a>. This contains examples of how various features are implemented in smali.<br>
<br>
The lexer/parser for smali is built with ANTLR v3, and the dex file generation is done by dexlib, a library I have written to read in and write out dex files.<br>
<br>
baksmali uses dexlib to read in dex files, and the StringTemplate library (a companion library to ANTLR) to generate the disassembly.<br>
<br>
<hr />

Developed With: <br>
<a href='http://www.jetbrains.com/idea/'>
<img src='http://www.jetbrains.com/idea/opensource/img/all/banners/idea120x30_blue.gif' alt='The best Java IDE' border='0' /></a>