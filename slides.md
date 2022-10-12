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

---

# Hearing background

<stereocilia-animation></stereocilia-animation>

---

# Proteins of mechanotransduction

<div class="flex">
<img src="/fettiplace.jpg" class="h-300px mx-auto"/>
<img src="/pcdh15.png" class="h-300px mx-auto"/>
<img src="/tmc.png" class="h-150px mx-auto mt-150px"/>
</div>
<p class="cite">[Fettiplace, Is TMC1 the Hair Cell Mechanotransducer Channel? Biophysical Journal, 2016]</p>




---
clicks: 4
---
# Tomography background


<div class="flex">
<Videoi  loop class="w-auto h-430px" src="/tomo_ex.mp4#t=0.6" :from="from" :to="to"></Videoi>

<script setup>
  import { onMounted , getCurrentInstance, ref, watch } from 'vue'
  import { inject } from 'vue'
  import { injectionRoute } from '@slidev/client/constants'
  // Run when slide mounted
  const route = inject(injectionRoute)
  const from = ref(0.6)
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
      })
</script>

<img src="/fourier_tomo.png" class="h-250px" />

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

<img v-click src="/graphannot.png" class="ml--70px"/>

</div>

<div class="w-400px">
<cite >Azubel, M., Carter, S. D., Weiszmann, J., Zhang, J., Jensen, G. J., Li, Y., & Kornberg, R. D. (2019). FGF21 trafficking in intact human cells revealed by cryo-electron tomography with gold nanoparticles. In eLife (Vol. 8).  </cite>
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
<li>Immuno-AuNPs detection of rare protein complexes in cryo-EM tomograms
<ul>
<li>Location</li>
<li>Numbers</li>
<li>Conformation</li>
<li>Structure?</li>
<li>But: For know only extracellular</li>
</ul>
</li>

<li v-click>Tip-links might occur with more than one copy at the tip, similar to channels</li>
<li v-click>Pcdh15 has a predetermined bending point to adopt to geometry required for trafficking</li>
</ul>

---

# Hematopoiesis and Ribosompathies

::left::


::right::

![Ribosomopathy](ruggero_blood_2014.jpg)

<p class="cite">[Ruggero and Shimamura, Marrow failure: a window into ribosome biology,  Blood, 2014]</p>

---
# Ribosomopathies hypotheses

---

# ER-HoxB8 cells


---
layout: video
background: '#000000'
clicks: 2
---
# 2DTM background

<Video src="/2dtm.mp4" class="h-full" :from="from" :to="to"></Video>

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
layout: video
background: '#000000'
clicks: 2
---

# Cutting windows into the cells

<Video src="/milling.webm" class="h-full" :from="from" :to="to"></Video>

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

---
clicks: 3
---

# Why and how DeCo-LACE

<img src="/classic2.png" class="h-400px mx-auto " v-after v-if="$slidev.nav.clicks<1"/>
<img src="/classic1.png" class="h-400px mx-auto " v-if="$slidev.nav.clicks===1" />
<img src="/classic3.png" class="h-400px mx-auto " v-if="$slidev.nav.clicks===2" />
<img src="/decolace.png" class="h-400px mx-auto " v-if="$slidev.nav.clicks===3" />
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


---

# Matches



---
clicks: 15
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
      to.value = 50
    }
  })
  



</script>


---

# What can we do? - Count


---
# What can we do? - Measure rotations

---

# What can we do? - Reconstruct and classify

---

# Summary


---

# Future plans

- Ribosomopathies

- Hematopoietic stem cells mobilization

- Metastasis

---

# Acknowledgments
