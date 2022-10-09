---
theme: ./theme
background: lamella_crop.png
class: text-center
highlighter: shiki
lineNumbers: false
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
drawings:
  persist: false
css: unocss
title: Cryo-EM imaging of biomolecular complexes in their native environment
---

# Cryo-EM imaging of biomolecular complexes in their native environment

From the rare mechanosensory transduction complex to the abundant ribosome


### Johannes Elferich

### 10/19/2022


---

# Why Cryo-EM?

::left::

- Electrons can be accelerated to hundreds of keV, wavelength that are much
  smaller than atomic radii

- Electrons can be manipulated using electric and magnetic fields, making 

::right::

![Gold atom](gold_on_graphene.png)

<p style="text-align: center">Single gold atom at the edge of a graphene sheet [Wang et.al., Nanoscale 2012]</p>

---

::left::

![Goodsell](goodsell.jpg)

<p style="text-align: center">Illustration by David S. Goodsell</p>

::right::

![Real EM](trueem.png)

- High energy electrons rapidly damage biological samples => Noisy images

- Biomolecules have very little contrast comparent to solvent

- No 3D, just a projection

- Small field of view


---

# How single-particle cryo-EM overcomes these challenges

::left::

<p class="text-center">Real space</p>

<img src="/ribo_real_space.png" class="h-200px mx-auto mt--10px"/>

<img src="/projection1.png" class="h-180px mx-auto mt--10px"/>


::right::

<p class="text-center">Fourier space</p>

<img src="/filled_fourier_space.png" class="h-200px mx-auto mt--10px"/>

<img src="/first_slice.png" class="h-200px mx-auto mt--10px"/>

---

# Hearing background

<stereocilia-animation></stereocilia-animation>

---

# Tomography background


<div class="flex">
<video controls muted loop id="myVideo2" class="w-auto h-430px">
  <source src="/tomo_ex.mp4" type="video/mp4">
</video>
<div class="grid grid-cols-2 ml-30px gap-y-0 gap-x-5px">
<div>
<p class="text-center mt-0 mb-0">XY</p>
<img src="/tomo_ex_xy.png" class="w-200px h-200px"/>
</div>
<div>
<p class="text-center mt-0 mb-0">ZY</p>
<img src="/tomo_ex_zy.png" class="w-200px h-200px"/>
</div>
<div>
<p class="text-center mt-0 mb-0">XZ</p>
<img src="/tomo_ex_xz.png" class="w-200px h-200px"/>
</div>
</div>
</div>

<style>
p {
  margin-top: 0 !important;
  margin-bottom: 0.1rem !important;
}
</style>

---


# Filaments are PCDH15

<div class="flex">
<img src="/isthispcdh15.png" class="w-auto h-400px mt-40px"/>
<img src="/meme.jpg" v-click class="w-auto h-200px ml-20px mt-140px" />
</div>

---

# Labeling with antibodies

<div class="grid grid-cols-2 justify-items-center gap-y-25px">
<img src="/poly.png" class="w-auto h-180px" />
<div class="flex">
<img v-click src="/g26.png" class="w-auto h-180px" />
<img v-after src="/g27.png" class="w-auto h-180px" />
</div>
<img v-click src="/slicer001.jpg" class="w-auto h-250px" />
<img v-after src="/title.png" class="w-auto h-250px" />
</div>

---

# Labeling Pcdh15 with antibodies - Monoclonal

<div class="grid grid-cols-3 gap-x-20px justify-items-center mt-50px" >
<img src="/azubel.jpg" />
<div v-click>
<h3 class="text-center ml-110px">39G7</h3>
<img src="/trunc.png" class="ml-50px"/>
</div>
<img v-click src="/graphannot.png" class="ml--70px"/>

</div>

<div class="w-400px">
<cite >Azubel, M., Carter, S. D., Weiszmann, J., Zhang, J., Jensen, G. J., Li, Y., & Kornberg, R. D. (2019). FGF21 trafficking in intact human cells revealed by cryo-electron tomography with gold nanoparticles. In eLife (Vol. 8).  </cite>
</div>

---
Id: custom
---



<Video src="/labeled_movie.mp4" loop autoplay>
</Video>


<div class="bg-gray-500/50 -ml-0.5rem pl-0.5rem  -mt-0.5rem rounded-1xl" style="display:table">
<h1 class="text-white m-0.5rem mb-0.5rem -ml-1rem">Detection in-situ</h1>
</div>

---

# Two AuNP labels consistent with Pcdh15 dimers

<img src="/dimer.png" />

---

# One AuNP label - monomer? 

<img src="/quant.png" class="mt-75px"/>

---

# Pcdh15 numbers at the tip

<img src="/stoi.png" class="h-430px w-auto m-auto"/>

---

# Cool example

<div class="abs-bl w-full h-full">

<img src="/Figure_6.png" class="h-551px ml-100px" />

</div>

---

# Summary

<ul>
<li>Immuno-AuNPs allow cryo-EM imaging of rare protein complexes
<ul>
<li>Location</li>
<li>Numbers</li>
<li>Conformation</li>
<li>Structure?</li>
</ul>
</li>

<li v-click>Tip-links might occur with more than one copy at the tip, similar to channels</li>
<li v-click>Pcdh15 and potentially Cdh23 have predetermined bending points to adopt geometries required for trafficking</li>
</ul>

---

# Ribosompathy background and ER-HoxB8

---

# 2DTM background

---

# Lamella and what they look like

---

# Inital matching

<img src="/initmatching.png" />

---

# Why and how DeCo-LACE

---
clicks: 5
---

<h1 class="text-white">DeCo-LACE data</h1>
<img class="abs-bl w-full -z-1" src="/assembly1.png" />
<img class="abs-bl w-full -z-1" src="/assembly_bad.png" v-click/>
<img class="abs-bl w-full -z-1" src="/assembly2.png" v-click/>
<img class="abs-bl w-full -z-1" src="/assembly3.png" v-click/>
<img class="abs-bl w-full -z-1" src="/assembly4.png" v-click/>

<Video src="/assembly.webm" v-if="$slidev.nav.clicks === 5" ></Video>





---


---

# Matches



---
clicks: 2
---

# Tour through lamella


<Video src="/movie2.mp4" v-if="$slidev.nav.clicks === 2" class="h-100%"></Video>


---

# Reconstruction

---

# Rotational analysis

---

# Summary

---

# Whats next - DeCo-LACE tomography

---

# The software

---

# Acknowledgments
