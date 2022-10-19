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

::left::

# Expectation

![Goodsell](goodsell.jpg)

<p style="text-align: center">Illustration by David S. Goodsell</p>

::right::
<div v-click>

# Reality

![Real EM](trueem.png)

- High energy electrons rapidly damage biological samples and biomolecules have very little contrast 

- No 3D, just a projection

- Small field of view
</div>

---



# Hearing background

<stereocilia-animation></stereocilia-animation>

---

# Proteins of mechanotransduction

<div class="flex mt-50px ml-50px">
<div>
<img src="/fettiplace.jpg" class="h-300px "/>
<p class="cite w-260px">[Fettiplace, R. Biophysical Journal (2016)]</p>
</div>
<div v-click>
<img src="/pcdh15.png" class="h-300px mx-auto"/>
<p class="cite w-260px ml-20px">[Ge, J.*, Elferich, J.*, et.al. eLife 2018]</p>
</div>
<div v-click>
<img src="/tmc.png" class="h-150px mx-auto mt-150px"/>
<p class="cite w-260px ml-20px">[Jeong, H.*, Clark, S.*, et.al. Nature 2022]</p>

</div>
</div>


---

# How to image stereocilia using cryo-EM

<div class="flex mt-100px">
<img src="/approach.png" class="h-280px w-auto"/>
<img src="/mmm1.png" class="h-280px w-auto ml-50px"/>
</div>
<p class="cite">[Metlagel, Z., Krey, J., et.al.  J Struct Biol. 2019]</p>


---
clicks: 4
---
# Tomography of stereocilia


<div class="flex">
<Videoi  loop class="w-auto h-430px" src="/tomo_ex.mp4#t=0.6" :from="from" :to="to"></Videoi>

<script setup>
  import { onMounted , getCurrentInstance, ref, watch } from 'vue'
  import { inject } from 'vue'
  import { injectionRoute } from '@slidev/client/constants'
  // Run when slide mounted
  const route = inject(injectionRoute)
  const from = ref(0.59)
  const to = ref(-1)
  // Watch for changes in $slidev.nav.clicks
  watch(() => $slidev.nav.clicks, (val) => {
    if (route.name !== $slidev.nav.route.name) return
    if (val === 0) {
      from.value = 0.59
      to.value = 0.6
    } else if (val === 1) {
      from.value = 0.6
      to.value = 300
      }
      else if (val > 1) {
      from.value = 0.6
      to.value = 0.6
      }
      })
</script>

<img src="/fourier_tomo.png" class="h-250px mt-100px" v-click="2"/>

<div class="grid grid-cols-2 ml-30px gap-y-0 gap-x-5px" v-click="3">
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

# There are filaments on stereocilia

<div class="flex">
<img src="/isthispcdh15.png" class="w-auto h-400px mt-40px"/>
<img src="/meme.jpg" v-click class="w-auto h-200px ml-20px mt-140px" />
</div>

---

# Labeling Pcdh15 with 39G7 AuNP 

<div class="grid grid-cols-3 gap-x-20px justify-items-center mt-50px" >
<img src="/azubel.jpg" />

<img v-click src="/graphannot.png" class="ml-70px"/>
<img v-click src="/we.png" class="ml--50px h-300px"/>

</div>

<div class="w-400px">
<p class="cite" >[Azubel, M. eLife 2019]</p>
</div>

---
Id: custom
---



<Video src="/labeled_movie.mp4" loop autoplay class="z--1">
</Video>


<div class="bg-gray-500/50 -ml-0.5rem pl-0.5rem  -mt-0.5rem rounded-1xl" style="display:table">
<h1 class="text-white m-0.5rem mb-0.5rem -ml-1rem">Detection in-situ</h1>
</div>

---

# Two AuNP labels consistent with Pcdh15 dimers

<img src="/dimer.png" class="mx-auto h-430px" />
<p class="cite" >[Elferich, J., et.al. eLife 2021]</p>
---

# One AuNP label - monomer? 

::left::
<div>
<img src="/mono1.png" class=""/>
<img src="/mono2.png" class=""/>
</div>
::right::
<img src="/quant.png" class="mt-75px"/>
::bottom::
<p class="cite" >[Elferich, J., et.al. eLife 2021]</p>

---

# Pcdh15 numbers at the tip

::left::

<img src="/numbers.png" class="mt-100px "/>


::right::
<img src="/stoi.png" v-click class="h-430px w-auto m-auto"/>
::bottom::
<p class="cite" >[Elferich, J., et.al. eLife 2021]</p>
---
clicks: 3
---
<Video src="/movie3.mp4" class="h-full" :from="from1" :to="to1" v-if="$slidev.nav.clicks<2"></Video>

<div class="flex">
<div class="h-400px" v-if="$slidev.nav.clicks>1">

<img src="/Figure_6.png" class="h-500px ml-0px" />

</div>
<Videoi src="/Video1.mp4" class="h-250px mt-130px ml-20px" autoplay loop v-if="$slidev.nav.clicks>2"></Videoi>
</div>

<script setup>
  import { onMounted , getCurrentInstance, ref, watch } from 'vue'
  import { inject } from 'vue'
  import { injectionRoute } from '@slidev/client/constants'
  // Run when slide mounted
  const route = inject(injectionRoute)
  const from1 = ref(-1)
  const to1 = ref(-1)
  const from2 = ref(-1)
  const to2 = ref(-1)
  onMounted(() => {
     console.log(route)
     console.log($slidev.nav.route)
  })
  // Watch for changes in $slidev.nav.clicks
  watch(() => $slidev.nav.clicks, (val) => {
    if (route.name !== $slidev.nav.route.name) return
    if (val === 0) {
      from1.value = -1
      to1.value = -1
      from2.value = -1
      to2.value = -1
    } else if (val === 1) {
      from1.value = 0
      to1.value = 100.0
    } else if (val > 1) {
      from1.value = 100.0
      to1.value = 100.0
    } else if (val === 3) {
      from2.value = 0.0
      to2.value = 100.0
    }  
  })
  

</script>

---

# Summary

<ul>
<li>Immuno-AuNPs enable detection of rare protein complexes in cryo-EM tomograms
<ul>
<li>Location</li>
<li>Numbers</li>
<li>Conformation</li>
<li>Structure?</li>
<li>But: For now only extracellular</li>
</ul>
</li>

<li v-click>Tip-links might occur with more than one copy at the tip, similar to channels</li>
<li v-click>Pcdh15 has a predetermined bending point to adopt to geometry required for trafficking</li>
</ul>

---
layout: section
---

# Quantitative Cryo-EM using 2D template matching

A new tool for the study of ribosomopathies and the hematopoietic system

---

# Hematopoiesis and Ribosompathies

::left::

![Ribosomopathy](/Hematopoiesis.jpg)

::right::

<img src="/ruggero_blood_2014.jpg" v-click class="mt-100px"/>

<p class="cite" v-after>[Ruggero, Shimamura,  Blood, 2014]</p>

---

# Ribosomopathies hypotheses

<img src="/hyops.jpg" class="mx-auto mt-50px" />
<p class="cite" v-after>[Gay, D., et.al. Trends in Biochemical Sciences, 2021]</p>

---
layout: video
background: '#000000'
clicks: 2
class: text-white
---
# 2D Template Matching

<Videoi src="/2dtm.mp4" class="h-400px mx-auto" :from="from" :to="to"></Videoi>


<p class="cite">
[Cryo-EM data collected by Johannes Elferich using Titan Krios microscope on Gatan K3 camera]
</p>
<p class="cite mt--30px">
[Background image of M31 collected by Nikolaus Grigorieff using Astro-Tech AT111EDT 111mm f/7 ED
triplet apochromatic refractor on Canon Digital Rebel XSi camera]
</p>
<script setup>
  import { onMounted , getCurrentInstance, ref, watch } from 'vue'
  import { inject } from 'vue'
  import { injectionRoute } from '@slidev/client/constants'
  // Run when slide mounted
  const route = inject(injectionRoute)
  const from = ref(-1)
  const to = ref(-1)
  // Watch for changes in $slidev.nav.clicks
  watch(() => $slidev.nav.clicks, (val) => {
    if (route.name !== $slidev.nav.route.name) return
    if (val === 0) {
      from.value = -1
      to.value = -1
    } else if (val === 1) {
      from.value = 0
      to.value = 300
      }
      })
 
</script>

---

# 2D Template Matching

::left::
<img src="/2dtm_initial.jpg"  class="w-300px mx-auto" />
<img src="/rick2.jpg"  class="w-300px mx-auto" />
<p class="cite">[Rickgauer, P., et.al. eLife 2017]</p>

::right::
<img src="/2dtm_ribo.jpg" class="w-300px ml-20px mx-auto mt-60px" v-click/>
<p class="cite" v-after>[Lucas, B., Himes, B. et.al. eLife 2021]</p>



---

# ER-HoxB8 cells

<div class="flex">
<img src="/erhox2.png" class="mx-auto h-300px" />

<img src="/erhox.png" class="mx-auto h-150px" />
</div>

<p class="cite">Wang, G., et.al. Nature methods 2006</p>
<p class="cite">Sykes, D., et.al. Cell 2016</p>

Genetic manipulation with CRISPR can be used to introduce Ribosomopathy-like defects
<p class="cite"></p>
---
layout: video
background: '#000000'
clicks: 2
class: text-white
---
# Cryo-FIB: Cutting windows into cells

<Videoi src="/milling.webm" class="h-full z--1" :from="from" :to="to" ></Videoi>

<script setup>
  import { onMounted , getCurrentInstance, ref, watch } from 'vue'
  import { inject } from 'vue'
  import { injectionRoute } from '@slidev/client/constants'
  // Run when slide mounted
  const route = inject(injectionRoute)
  const from = ref(-1)
  const to = ref(-1)
  // Watch for changes in $slidev.nav.clicks
  watch(() => $slidev.nav.clicks, (val) => {
    if (route.name !== $slidev.nav.route.name) return
    if (val === 0) {
      from.value = -1
      to.value = -1
    } else if (val === 1) {
      from.value = 3
      to.value = 300
      }
      })
 
</script>

---

# Lamella and what they look like

::left::

<p class="text-center">Undifferentiated</p>

<img src="/undiff.png" class="h-400px mx-auto" />

::right::

<p class="text-center">Differentiated</p>

<img src="/diff.png" class="h-400px mx-auto" />

---

# Inital matching

<img src="/initmatching.png" />

<p class="cite" >[Elferich, J., Schiroli, G., Scadden, D., Grigoriff, N. bioRxiv 2022]</p>


---
clicks: 2
---

# How we acquire Cryo-EM data

<img src="/classic2.png" class="h-400px mx-auto " v-after v-if="$slidev.nav.clicks<1"/>
<img src="/classic1.png" class="h-400px mx-auto " v-if="$slidev.nav.clicks===1" />
<img src="/classic3.png" class="h-400px mx-auto " v-if="$slidev.nav.clicks===2" />

---
clicks: 6
---

# Defocus-Corrected Large Area Cryo-EM (DeCo-LACE)

<img src="/deco1.png" class="h-400px mx-auto "  v-if="$slidev.nav.clicks<1" />
<img src="/deco2.png" class="h-400px mx-auto "  v-if="$slidev.nav.clicks===1" />
<img src="/deco3.png" class="h-400px mx-auto "  v-if="$slidev.nav.clicks===2" />
<img src="/deco4.png" class="h-400px mx-auto "  v-if="$slidev.nav.clicks===3" />
<img src="/deco5.png" class="h-400px mx-auto "  v-if="$slidev.nav.clicks===4" />
<img src="/deco6.png" class="h-400px mx-auto "  v-if="$slidev.nav.clicks===5" />
<img src="/decofinal.png" class="h-400px mx-auto "  v-if="$slidev.nav.clicks===6" />

---
clicks: 5
---

<h1 class="text-white">DeCo-LACE data</h1>
<img class="abs-bl w-full -z-1" src="/assembly1.png" />
<img class="abs-bl w-full -z-1" src="/assembly_bad.png" v-click/>
<img class="abs-bl w-full -z-1" src="/assembly2.png" v-click/>
<img class="abs-bl w-full -z-1" src="/assembly3.png" v-click/>
<img class="abs-bl w-full -z-1" src="/assembly4.png" v-click/>

<Video src="/assembly.webm" v-if="$slidev.nav.clicks === 5" autoplay class="-z-1" ></Video>


---

# Does DeCo-LACE provide high-resolution data

<img src="/the_lamella.png" class="h-250px mx-auto" />

<img src="/focus.png" class="h-190px mx-auto mt-10px" />
<p class="cite" >[Elferich, J., Schiroli, G., Scadden, D., Grigorieff, N. bioRxiv 2022]</p>


---
clicks: 7
layout: video
background: '#000000'

---
<Video src="/movie2.mp4" class="h-full" :from="from" :to="to"></Video>

<script setup>
  import { onMounted , getCurrentInstance, ref, watch } from 'vue'
  import { inject } from 'vue'
  import { injectionRoute } from '@slidev/client/constants'
  // Run when slide mounted
  const route = inject(injectionRoute)
  const from = ref(-1)
  const to = ref(-1)
  onMounted(() => {
     console.log(route)
     console.log($slidev.nav.route)
  })
  // Watch for changes in $slidev.nav.clicks
  watch(() => $slidev.nav.clicks, (val) => {
    if (route.name !== $slidev.nav.route.name) return
    if (val === 0) {
      from.value = -1
      to.value = -1
    } else if (val === 1) {
      from.value = 0
      to.value = 9.54
    } else if (val === 2) {
      from.value = 9.6
      to.value = 18.0
    } else if (val === 3) {
      from.value = 20.0
      to.value = 24.0
    } else if (val === 4) {
      from.value = 24.0
      to.value = 33
    } else if (val === 5) {
      from.value = 35.0
      to.value = 39.0
    } else if (val === 6) {
      from.value = 39.0
      to.value = 48.0
    } else if (val === 7) {
      from.value = 48.0
      to.value = 54.0
    }
  })
  



</script>


---

# What can we do? - Count

<img src="/count.png" class="mx-auto" />
<p class="cite" >[Elferich, J., Schiroli, G., Scadden, D., Grigoriff, N. bioRxiv 2022]</p>

---
clicks: 2
---
# What can we do? - Measure rotations

::left::

<img src="/greenup.png" class="w-200px mx-auto mt-20px"/>
<img src="/ring.png" class="w-200px mx-auto mt-20px" />

::right::

<Videoi src="/movie5.mp4" autoplay v-if="$slidev.nav.clicks == 1"></Videoi>
<Videoi src="/movie6.mp4" autoplay v-if="$slidev.nav.clicks == 2"></Videoi>

---
clicks: 2
---

# What can we do? - Reconstruct and classify

::left::

<Videoi src="/rec1.mp4" autoplay v-if="$slidev.nav.clicks === 0"></Videoi>
<Videoi src="/rec2.mp4" autoplay v-if="$slidev.nav.clicks === 1"></Videoi>
<Videoi src="/rec2.mp4" v-if="$slidev.nav.clicks === 2"></Videoi>
::right::

<img src="class.png" class="mt-20px" v-if="$slidev.nav.clicks === 2"/>
<p class="cite" v-if="$slidev.nav.clicks === 2">[Lucas, B. et.al. eLife 2022]</p>

---

# Future plans

::left::
### Ribosomopathies

- Introduce mutations found in DBA and SDS patients into the ER-HoxB8 system using CRISPR/Cas9

- Quantify the difference in ribosome state between wild-type and mutant cells
  - Local concentration
  - Ribosome arrangment (membrane-bound/polysome)
  - Ribosome composition



::right::

<div v-click>

### Hematopoietic stem cell mobilization

<img src="/traff.png" class="w-300px mx-auto mt-20px" />

<p class="cite">[Mazo, I., et.al. Trends in Immunology 2011]</p>

- Identify molecules that form cell-cell interactions using Fab-AuNPs

- Use 2DTM to quantify changes in cytoskeleteon

</div>

<div v-click>

### Can the same tools be used to study metastasis?

</div>

---

# Acknowledgements

::left::
<p class="pi">Eric Gouaux</p>
<p class="sig">Sarah Clark</p>
<p class="sig">Jingpeng Ge</p>
<p class="sig">April Goehring</p>
<p class="sig">Aya Matsui</p>
<p>Gouaux lab members</p>
<p class="pi">Peter Barr-Gillespie</p>
<p>Jocelyn Krey</p>
<p class="pi">Theresa Nicholson</p>
<p class="pi">Pacific Northwest Cryo-EM Center:​</p>
<p>Claudia Lopez​​</p>
<p>Craig Yoshioka​​</p>
<p class="pi">Janelia Cryo-EM core:</p>
<p>Xiaowei Zhao</p>
<p>Shixin Yang</p>
<p class="pi">Other:​</p>
<p>Lauren-Ann Metskalis​​</p>
<p>Maia Azubel​</p>

::right::
<p class="pi">Niko Grigorieff</p>
<p>Bronwyn Lucas</p>
<p>Ben Himes</p>
<p>Grigorieff lab members</p>
<p class="pi">Tim Grant</p>
<p class="pi">David Scadden</p>
<p>Giulia Schiroli</p>
<p class="pi">UMass Medical School Cryo-EM core:</p>
<p>Chen Xu</p>
<p>Kangkang Song</p>


<style>
  .slidev-layout p {
    @apply leading-5 my-0 !important;
  }
  p.sig {
    @apply font-bold
  }
  p.pi{
    @apply font-bold underline mt-1rem
  }
</style>


---
layout: section
---

# Extras


---
clicks: 1
layout: video
background: '#000000'

---
<Video src="/decotilt.mp4" class="h-full" :from="from" :to="to" loop></Video>

<script setup>
  import { onMounted , getCurrentInstance, ref, watch } from 'vue'
  import { inject } from 'vue'
  import { injectionRoute } from '@slidev/client/constants'
  // Run when slide mounted
  const route = inject(injectionRoute)
  const from = ref(-1)
  const to = ref(-1)
  onMounted(() => {
     console.log(route)
     console.log($slidev.nav.route)
  })
  // Watch for changes in $slidev.nav.clicks
  watch(() => $slidev.nav.clicks, (val) => {
    if (route.name !== $slidev.nav.route.name) return
    if (val === 0) {
      from.value = -1
      to.value = -1
    } else if (val === 1) {
      from.value = 0
      to.value = 50.0
    }
  })
  



</script>


---

# 2DTM of microtubules

::left::

### At cell periphery

<img src="/mitoneuro1.png" class="mx-auto w-60%"/>
<img src="/mitoneuro2.png" class="mx-auto w-60%"/>


::right::

### In DeCo-LACE imaged lamelle

<img src="/mitodeco1.png" class="mx-auto w-45%"/>
<img src="/mitodeco2.png" class="mx-auto w-45%"/>

---
clicks: 5
---

# How single-particle cryo-EM overcomes these challenges

::left::

<p class="text-center">Real space</p>

<arrow x1="380" y1="200" x2="580" y2="200" color="green" width="3" />
<arrow x1="580" y1="240" x2="380" y2="240" color="green" width="3" />



<img src="/ribo_real_space.png" class="h-200px mx-auto mt--20px" v-if="$slidev.nav.clicks<2"/>
<img src="/ribo_real_space2.png" class="h-200px mx-auto mt--20px" v-if="$slidev.nav.clicks===2"/>
<img src="/ribo_real_space3.png" class="h-200px mx-auto mt--20px" v-if="$slidev.nav.clicks===3"/>
<img src="/ribo_real_space4.png" class="h-200px mx-auto mt--20px" v-if="$slidev.nav.clicks===4"/>
<Videoi src="/ribo_video.webm" class="h-200px mx-auto mt--20px" autoplay v-if="$slidev.nav.clicks===5"></Videoi>

<img src="/projection1.png" class="h-150px mx-auto mt-10px" v-click v-if="$slidev.nav.clicks<2" />
<img src="/projection2.png" class="h-150px mx-auto mt-10px" v-if="$slidev.nav.clicks===2"/>
<img src="/projection3.png" class="h-150px mx-auto mt-10px" v-if="$slidev.nav.clicks===3"/>
<img src="/projection4.png" class="h-150px mx-auto mt-10px" v-if="$slidev.nav.clicks===4"/>
<Videoi src="/projection_video.webm" class="h-150px mx-auto mt-10px " autoplay v-if="$slidev.nav.clicks===5"></Videoi>

<arrow x1="380" y1="400" x2="580" y2="400" color="green" width="3" v-after />
<arrow x1="580" y1="440" x2="380" y2="440" color="green" width="3" v-after />

::right::

<p class="text-center">Fourier space</p>

<img src="/filled_fourier_space.png" class="h-200px mx-auto mt--20px"/>

<img src="/first_slice.png" class="h-200px mx-auto " v-after v-if="$slidev.nav.clicks<2"/>
<img src="/first_slice2.png" class="h-200px mx-auto " v-if="$slidev.nav.clicks===2" />
<img src="/first_slice3.png" class="h-200px mx-auto " v-if="$slidev.nav.clicks===3" />
<img src="/first_slice4.png" class="h-200px mx-auto " v-if="$slidev.nav.clicks===4" />
<Videoi src="/slices_video.webm" class="h-200px mx-auto " autoplay v-if="$slidev.nav.clicks===5"></Videoi>
