# Awesome-Continual-Multi-view-clustering

[stars-img]: https://img.shields.io/github/stars/wanxinhang/Awesome-Continual-Multi-view-clustering?style=plastic
[stars-url]: https://github.com/wanxinhang/Awesome-Continual-Multi-view-clustering/stargazers
[fork-img]: https://img.shields.io/github/forks/wanxinhang/Awesome-Continual-Multi-view-clustering?style=plastic
[fork-url]: https://github.com/wanxinhang/Awesome-Continual-Multi-view-clustering/network/members

[![GitHub stars][stars-img]][stars-url]
[![GitHub forks][fork-img]][fork-url]

Collections for **Awesome-Continual-Multi-view-clustering** methods (papers and codes).
We are looking forward for other participants to share their papers and codes. If interested, please contact <wanxinhang@nudt.edu.cn>.

**Update at May 2024.**
## What's Continual Multi-view clustering?
Existing multi-view overlooks scenarios where data views are collected sequentially, i.e., real-time data. Due to privacy issues or memory burden, previous views are not available with time in these situations. Continual Multi-view clustering aims to conduct the clustering task in this setting.

## Papers
|Paper|Year|Publish|PDF|Code|
|  :-----: | :------: | :------: | :------: | :------: |
|Contrastive Continual Multi-view Clustering with Filtered Structural Fusion (CCMVC-FSF)|2024|TNNLS|[link](https://ieeexplore.ieee.org/document/10777843)|[matlab](https://github.com/wanxinhang/CCMVC-FSF)|
|Live and Learn: Continual Action Clustering with Incremental Views (CAC)|2024|AAAI|[link](https://ojs.aaai.org/index.php/AAAI/article/view/29561)|-|
|Fast Continual Multi-View Clustering With Incomplete Views (FCMVC-IV)|2024|TIP|[link](https://ieeexplore.ieee.org/document/10506102)|[matlab](https://github.com/wanxinhang/TIP-2024-FCMVC-IV)|
|Continual Multi-view Clustering (CMVC)|2022|ACM MM|[link](https://dl.acm.org/doi/abs/10.1145/3503161.3547864)|[matlab](https://github.com/wanxinhang/ACMMM2022-CMVC)|
|Incremental multi-view spectral clustering with sparse and connected graph learning (SCGL)|2021|NN|[link](https://www.sciencedirect.com/science/article/pii/S0893608021003440)|[matlab](https://github.com/YHOOW/SCGL)|
|Incremental multi-view spectral clustering (IMSC)|2019|KBS|[link](https://www.sciencedirect.com/science/article/pii/S0950705119301030)|[matlab](https://github.com/wanxinhang/Awesome-Continual-Multi-view-clustering/tree/main/code/IMSC)|
---

## Some-useful-links:

https://github.com/wanxinhang/Awesome-Semi-supervised-Multi-view-classification/

https://github.com/dugzzuli/A-Survey-of-Multi-view-Clustering-Approaches#the-information-fusion-strategy

https://github.com/wangsiwei2010/awesome-multi-view-clustering

https://github.com/liangnaiyao/multiview_learning

https://github.com/Jeaninezpp/Incomplete-multi-view-clustering#incomplete-multi-view-clustering.

## Citations:
@ARTICLE{10506102,
  author={Wan, Xinhang and Xiao, Bin and Liu, Xinwang and Liu, Jiyuan and Liang, Weixuan and Zhu, En},
  journal={IEEE Transactions on Image Processing}, 
  title={Fast Continual Multi-View Clustering With Incomplete Views}, 
  year={2024},
  volume={33},
  number={},
  pages={2995-3008},
  keywords={Complexity theory;Kernel;Task analysis;Clustering algorithms;Real-time systems;Privacy;Fuses;Multi-view learning;clustering;continual learning},
  doi={10.1109/TIP.2024.3388974}}

@ARTICLE{10777843,
  author={Wan, Xinhang and Liu, Jiyuan and Yu, Hao and Qu, Qian and Li, Ao and Liu, Xinwang and Liang, Ke and Dong, Zhibin and Zhu, En},
  journal={IEEE Transactions on Neural Networks and Learning Systems}, 
  title={Contrastive Continual Multiview Clustering With Filtered Structural Fusion}, 
  year={2024},
  volume={},
  number={},
  pages={1-14},
  keywords={Kernel;Information filters;Privacy;Correlation;Contrastive learning;Clustering methods;Technological innovation;Stability plasticity;Real-time systems;Complexity theory;Clustering;continual learning;multiview learning},
  doi={10.1109/TNNLS.2024.3502455}}


@inproceedings{10.1145/3503161.3547864,
author = {Wan, Xinhang and Liu, Jiyuan and Liang, Weixuan and Liu, Xinwang and Wen, Yi and Zhu, En},
title = {Continual Multi-View Clustering},
year = {2022},
isbn = {9781450392037},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/3503161.3547864},
doi = {10.1145/3503161.3547864},
booktitle = {Proceedings of the 30th ACM International Conference on Multimedia},
pages = {3676–3684},
numpages = {9},
keywords = {multi-view clustering, consensus partition matrix, late fusion, continual learning},
location = {Lisboa, Portugal},
series = {MM '22}
}


@article{Yan_Gan_Mao_Ye_Yu_2024, title={Live and Learn: Continual Action Clustering with Incremental Views}, volume={38}, url={https://ojs.aaai.org/index.php/AAAI/article/view/29561}, DOI={10.1609/aaai.v38i15.29561},  number={15}, journal={Proceedings of the AAAI Conference on Artificial Intelligence}, author={Yan, Xiaoqiang and Gan, Yingtao and Mao, Yiqiao and Ye, Yangdong and Yu, Hui}, year={2024}, month={Mar.}, pages={16264-16271} }

@article{YIN2021260,
title = {Incremental multi-view spectral clustering with sparse and connected graph learning},
journal = {Neural Networks},
volume = {144},
pages = {260-270},
year = {2021},
issn = {0893-6080},
doi = {https://doi-org-s.libyc.nudt.edu.cn:443/10.1016/j.neunet.2021.08.031},
url = {https://www-sciencedirect-com-s.libyc.nudt.edu.cn:443/science/article/pii/S0893608021003440},
author = {Hongwei Yin and Wenjun Hu and Zhao Zhang and Jungang Lou and Minmin Miao},
keywords = {Multi-view clustering, Incremental clustering, Sparse graph learning, Connected graph learning, Spectral embedding},
}

@article{ZHOU201973,
title = {Incremental multi-view spectral clustering},
journal = {Knowledge-Based Systems},
volume = {174},
pages = {73-86},
year = {2019},
issn = {0950-7051},
doi = {https://doi-org-s.libyc.nudt.edu.cn:443/10.1016/j.knosys.2019.02.036},
url = {https://www-sciencedirect-com-s.libyc.nudt.edu.cn:443/science/article/pii/S0950705119301030},
author = {Peng Zhou and Yi-Dong Shen and Liang Du and Fan Ye and Xuejun Li},
keywords = {Multi-view clustering, Spectral clustering, Incremental learning},
}

###### TIPS
- If you find this repository useful to your research or work, it is really appreciate to star this repository. 
- We are looking forward to any comments or discussions or contributions on this topic. :)
