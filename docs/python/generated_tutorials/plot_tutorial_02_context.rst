
.. DO NOT EDIT.
.. THIS FILE WAS AUTOMATICALLY GENERATED BY SPHINX-GALLERY.
.. TO MAKE CHANGES, EDIT THE SOURCE PYTHON FILE:
.. "python/generated_tutorials/plot_tutorial_02_context.py"
.. LINE NUMBERS ARE GIVEN BELOW.

.. only:: html

    .. note::
        :class: sphx-glr-download-link-note

        Click :ref:`here <sphx_glr_download_python_generated_tutorials_plot_tutorial_02_context.py>`
        to download the full example code

.. rst-class:: sphx-glr-example-title

.. _sphx_glr_python_generated_tutorials_plot_tutorial_02_context.py:


Tutorial 02: Context Decoding
=========================================

In this tutorial you will learn about the context decoding tools included with
BrainStat. The context decoding module consists of three parts: genetic
decoding, meta-analytic decoding and histological comparisons. Before we start,
lets run a linear model testing for the effects of age on cortical thickness as
we did in Tutorial 1. We'll use the results of this model later in this
tutorial.

.. GENERATED FROM PYTHON SOURCE LINES 12-37

.. code-block:: default


    import numpy as np

    from brainstat.datasets import fetch_mask, fetch_template_surface
    from brainstat.stats.SLM import SLM
    from brainstat.stats.terms import FixedEffect
    from brainstat.tutorial.utils import fetch_abide_data

    sites = ("PITT", "OLIN", "OHSU")
    thickness, demographics = fetch_abide_data(sites=sites)
    mask = fetch_mask("civet41k")

    demographics.DX_GROUP[demographics.DX_GROUP == 1] = "Patient"
    demographics.DX_GROUP[demographics.DX_GROUP == 2] = "Control"

    term_age = FixedEffect(demographics.AGE_AT_SCAN)
    term_patient = FixedEffect(demographics.DX_GROUP)
    model = term_age + term_patient

    contrast_age = model.AGE_AT_SCAN
    slm_age = SLM(
        model, contrast_age, surf="civet41k", mask=mask, correction=["fdr", "rft"]
    )
    slm_age.fit(thickness)





.. rst-class:: sphx-glr-script-out

 Out:

 .. code-block:: none

    0it [00:00, ?it/s]    Fetching thickness data for subject 1 out of 116: : 0it [00:00, ?it/s]    Fetching thickness data for subject 1 out of 116: : 1it [00:00,  2.18it/s]    Fetching thickness data for subject 2 out of 116: : 1it [00:00,  2.18it/s]    Fetching thickness data for subject 2 out of 116: : 2it [00:00,  2.78it/s]    Fetching thickness data for subject 3 out of 116: : 2it [00:00,  2.78it/s]    Fetching thickness data for subject 3 out of 116: : 3it [00:01,  2.75it/s]    Fetching thickness data for subject 4 out of 116: : 3it [00:01,  2.75it/s]    Fetching thickness data for subject 4 out of 116: : 4it [00:01,  3.29it/s]    Fetching thickness data for subject 5 out of 116: : 4it [00:01,  3.29it/s]    Fetching thickness data for subject 5 out of 116: : 5it [00:01,  3.38it/s]    Fetching thickness data for subject 6 out of 116: : 5it [00:01,  3.38it/s]    Fetching thickness data for subject 6 out of 116: : 6it [00:01,  3.52it/s]    Fetching thickness data for subject 7 out of 116: : 6it [00:01,  3.52it/s]    Fetching thickness data for subject 7 out of 116: : 7it [00:02,  2.58it/s]    Fetching thickness data for subject 8 out of 116: : 7it [00:02,  2.58it/s]    Fetching thickness data for subject 8 out of 116: : 8it [00:02,  2.55it/s]    Fetching thickness data for subject 9 out of 116: : 8it [00:02,  2.55it/s]    Fetching thickness data for subject 9 out of 116: : 9it [00:03,  2.73it/s]    Fetching thickness data for subject 10 out of 116: : 9it [00:03,  2.73it/s]    Fetching thickness data for subject 10 out of 116: : 10it [00:03,  3.01it/s]    Fetching thickness data for subject 11 out of 116: : 10it [00:03,  3.01it/s]    Fetching thickness data for subject 11 out of 116: : 11it [00:03,  2.73it/s]    Fetching thickness data for subject 12 out of 116: : 11it [00:03,  2.73it/s]    Fetching thickness data for subject 12 out of 116: : 12it [00:04,  2.96it/s]    Fetching thickness data for subject 13 out of 116: : 12it [00:04,  2.96it/s]    Fetching thickness data for subject 13 out of 116: : 13it [00:04,  3.31it/s]    Fetching thickness data for subject 14 out of 116: : 13it [00:04,  3.31it/s]    Fetching thickness data for subject 14 out of 116: : 14it [00:04,  3.54it/s]    Fetching thickness data for subject 15 out of 116: : 14it [00:04,  3.54it/s]    Fetching thickness data for subject 15 out of 116: : 15it [00:04,  3.72it/s]    Fetching thickness data for subject 16 out of 116: : 15it [00:04,  3.72it/s]    Fetching thickness data for subject 16 out of 116: : 16it [00:05,  3.76it/s]    Fetching thickness data for subject 17 out of 116: : 16it [00:05,  3.76it/s]    Fetching thickness data for subject 17 out of 116: : 17it [00:05,  3.71it/s]    Fetching thickness data for subject 18 out of 116: : 17it [00:05,  3.71it/s]    Fetching thickness data for subject 18 out of 116: : 18it [00:05,  3.75it/s]    Fetching thickness data for subject 19 out of 116: : 18it [00:05,  3.75it/s]    Fetching thickness data for subject 19 out of 116: : 19it [00:05,  3.70it/s]    Fetching thickness data for subject 20 out of 116: : 19it [00:05,  3.70it/s]    Fetching thickness data for subject 20 out of 116: : 20it [00:06,  3.76it/s]    Fetching thickness data for subject 21 out of 116: : 20it [00:06,  3.76it/s]    Fetching thickness data for subject 21 out of 116: : 21it [00:06,  3.98it/s]    Fetching thickness data for subject 22 out of 116: : 21it [00:06,  3.98it/s]    Fetching thickness data for subject 22 out of 116: : 22it [00:06,  4.07it/s]    Fetching thickness data for subject 23 out of 116: : 22it [00:06,  4.07it/s]    Fetching thickness data for subject 23 out of 116: : 23it [00:06,  4.07it/s]    Fetching thickness data for subject 24 out of 116: : 23it [00:06,  4.07it/s]    Fetching thickness data for subject 24 out of 116: : 24it [00:07,  4.21it/s]    Fetching thickness data for subject 25 out of 116: : 24it [00:07,  4.21it/s]    Fetching thickness data for subject 25 out of 116: : 25it [00:07,  4.38it/s]    Fetching thickness data for subject 26 out of 116: : 25it [00:07,  4.38it/s]    Fetching thickness data for subject 26 out of 116: : 26it [00:07,  4.50it/s]    Fetching thickness data for subject 27 out of 116: : 26it [00:07,  4.50it/s]    Fetching thickness data for subject 27 out of 116: : 27it [00:07,  4.53it/s]    Fetching thickness data for subject 28 out of 116: : 27it [00:07,  4.53it/s]    Fetching thickness data for subject 28 out of 116: : 28it [00:07,  4.46it/s]    Fetching thickness data for subject 29 out of 116: : 28it [00:07,  4.46it/s]    Fetching thickness data for subject 29 out of 116: : 29it [00:08,  4.49it/s]    Fetching thickness data for subject 30 out of 116: : 29it [00:08,  4.49it/s]    Fetching thickness data for subject 30 out of 116: : 30it [00:08,  4.55it/s]    Fetching thickness data for subject 31 out of 116: : 30it [00:08,  4.55it/s]    Fetching thickness data for subject 31 out of 116: : 31it [00:08,  4.46it/s]    Fetching thickness data for subject 32 out of 116: : 31it [00:08,  4.46it/s]    Fetching thickness data for subject 32 out of 116: : 32it [00:08,  4.53it/s]    Fetching thickness data for subject 33 out of 116: : 32it [00:08,  4.53it/s]    Fetching thickness data for subject 33 out of 116: : 33it [00:09,  4.55it/s]    Fetching thickness data for subject 34 out of 116: : 33it [00:09,  4.55it/s]    Fetching thickness data for subject 34 out of 116: : 34it [00:09,  4.62it/s]    Fetching thickness data for subject 35 out of 116: : 34it [00:09,  4.62it/s]    Fetching thickness data for subject 35 out of 116: : 35it [00:09,  4.66it/s]    Fetching thickness data for subject 36 out of 116: : 35it [00:09,  4.66it/s]    Fetching thickness data for subject 36 out of 116: : 36it [00:09,  4.68it/s]    Fetching thickness data for subject 37 out of 116: : 36it [00:09,  4.68it/s]    Fetching thickness data for subject 37 out of 116: : 37it [00:09,  4.71it/s]    Fetching thickness data for subject 38 out of 116: : 37it [00:09,  4.71it/s]    Fetching thickness data for subject 38 out of 116: : 38it [00:10,  4.68it/s]    Fetching thickness data for subject 39 out of 116: : 38it [00:10,  4.68it/s]    Fetching thickness data for subject 39 out of 116: : 39it [00:10,  4.72it/s]    Fetching thickness data for subject 40 out of 116: : 39it [00:10,  4.72it/s]    Fetching thickness data for subject 40 out of 116: : 40it [00:10,  4.42it/s]    Fetching thickness data for subject 41 out of 116: : 40it [00:10,  4.42it/s]    Fetching thickness data for subject 41 out of 116: : 41it [00:10,  4.47it/s]    Fetching thickness data for subject 42 out of 116: : 41it [00:10,  4.47it/s]    Fetching thickness data for subject 42 out of 116: : 42it [00:11,  4.16it/s]    Fetching thickness data for subject 43 out of 116: : 42it [00:11,  4.16it/s]    Fetching thickness data for subject 43 out of 116: : 43it [00:11,  3.59it/s]    Fetching thickness data for subject 44 out of 116: : 43it [00:11,  3.59it/s]    Fetching thickness data for subject 44 out of 116: : 44it [00:11,  3.57it/s]    Fetching thickness data for subject 45 out of 116: : 44it [00:11,  3.57it/s]    Fetching thickness data for subject 45 out of 116: : 45it [00:12,  3.61it/s]    Fetching thickness data for subject 46 out of 116: : 45it [00:12,  3.61it/s]    Fetching thickness data for subject 46 out of 116: : 46it [00:12,  3.44it/s]    Fetching thickness data for subject 47 out of 116: : 46it [00:12,  3.44it/s]    Fetching thickness data for subject 47 out of 116: : 47it [00:12,  3.62it/s]    Fetching thickness data for subject 48 out of 116: : 47it [00:12,  3.62it/s]    Fetching thickness data for subject 48 out of 116: : 48it [00:13,  2.96it/s]    Fetching thickness data for subject 49 out of 116: : 48it [00:13,  2.96it/s]    Fetching thickness data for subject 49 out of 116: : 49it [00:13,  2.90it/s]    Fetching thickness data for subject 50 out of 116: : 49it [00:13,  2.90it/s]    Fetching thickness data for subject 50 out of 116: : 50it [00:13,  3.20it/s]    Fetching thickness data for subject 51 out of 116: : 50it [00:13,  3.20it/s]    Fetching thickness data for subject 51 out of 116: : 51it [00:13,  3.53it/s]    Fetching thickness data for subject 52 out of 116: : 51it [00:13,  3.53it/s]    Fetching thickness data for subject 52 out of 116: : 52it [00:14,  3.72it/s]    Fetching thickness data for subject 53 out of 116: : 52it [00:14,  3.72it/s]    Fetching thickness data for subject 53 out of 116: : 53it [00:14,  3.88it/s]    Fetching thickness data for subject 54 out of 116: : 53it [00:14,  3.88it/s]    Fetching thickness data for subject 54 out of 116: : 54it [00:14,  4.12it/s]    Fetching thickness data for subject 55 out of 116: : 54it [00:14,  4.12it/s]    Fetching thickness data for subject 55 out of 116: : 55it [00:14,  3.82it/s]    Fetching thickness data for subject 56 out of 116: : 55it [00:14,  3.82it/s]    Fetching thickness data for subject 56 out of 116: : 56it [00:15,  3.63it/s]    Fetching thickness data for subject 57 out of 116: : 56it [00:15,  3.63it/s]    Fetching thickness data for subject 57 out of 116: : 57it [00:15,  3.88it/s]    Fetching thickness data for subject 58 out of 116: : 57it [00:15,  3.88it/s]    Fetching thickness data for subject 58 out of 116: : 58it [00:15,  3.89it/s]    Fetching thickness data for subject 59 out of 116: : 58it [00:15,  3.89it/s]    Fetching thickness data for subject 59 out of 116: : 59it [00:15,  3.99it/s]    Fetching thickness data for subject 60 out of 116: : 59it [00:15,  3.99it/s]    Fetching thickness data for subject 60 out of 116: : 60it [00:16,  4.16it/s]    Fetching thickness data for subject 61 out of 116: : 60it [00:16,  4.16it/s]    Fetching thickness data for subject 61 out of 116: : 61it [00:16,  4.08it/s]    Fetching thickness data for subject 62 out of 116: : 61it [00:16,  4.08it/s]    Fetching thickness data for subject 62 out of 116: : 62it [00:16,  4.06it/s]    Fetching thickness data for subject 63 out of 116: : 62it [00:16,  4.06it/s]    Fetching thickness data for subject 63 out of 116: : 63it [00:16,  4.22it/s]    Fetching thickness data for subject 64 out of 116: : 63it [00:16,  4.22it/s]    Fetching thickness data for subject 64 out of 116: : 64it [00:17,  4.15it/s]    Fetching thickness data for subject 65 out of 116: : 64it [00:17,  4.15it/s]    Fetching thickness data for subject 65 out of 116: : 65it [00:17,  4.17it/s]    Fetching thickness data for subject 66 out of 116: : 65it [00:17,  4.17it/s]    Fetching thickness data for subject 66 out of 116: : 66it [00:17,  4.22it/s]    Fetching thickness data for subject 67 out of 116: : 66it [00:17,  4.22it/s]    Fetching thickness data for subject 67 out of 116: : 67it [00:17,  4.31it/s]    Fetching thickness data for subject 68 out of 116: : 67it [00:17,  4.31it/s]    Fetching thickness data for subject 68 out of 116: : 68it [00:17,  4.34it/s]    Fetching thickness data for subject 69 out of 116: : 68it [00:17,  4.34it/s]    Fetching thickness data for subject 69 out of 116: : 69it [00:18,  4.38it/s]    Fetching thickness data for subject 70 out of 116: : 69it [00:18,  4.38it/s]    Fetching thickness data for subject 70 out of 116: : 70it [00:18,  4.22it/s]    Fetching thickness data for subject 71 out of 116: : 70it [00:18,  4.22it/s]    Fetching thickness data for subject 71 out of 116: : 71it [00:18,  4.25it/s]    Fetching thickness data for subject 72 out of 116: : 71it [00:18,  4.25it/s]    Fetching thickness data for subject 72 out of 116: : 72it [00:18,  4.34it/s]    Fetching thickness data for subject 73 out of 116: : 72it [00:18,  4.34it/s]    Fetching thickness data for subject 73 out of 116: : 73it [00:19,  4.33it/s]    Fetching thickness data for subject 74 out of 116: : 73it [00:19,  4.33it/s]    Fetching thickness data for subject 74 out of 116: : 74it [00:19,  4.43it/s]    Fetching thickness data for subject 75 out of 116: : 74it [00:19,  4.43it/s]    Fetching thickness data for subject 75 out of 116: : 75it [00:19,  4.10it/s]    Fetching thickness data for subject 76 out of 116: : 75it [00:19,  4.10it/s]    Fetching thickness data for subject 76 out of 116: : 76it [00:19,  4.08it/s]    Fetching thickness data for subject 77 out of 116: : 76it [00:19,  4.08it/s]    Fetching thickness data for subject 77 out of 116: : 77it [00:20,  4.13it/s]    Fetching thickness data for subject 78 out of 116: : 77it [00:20,  4.13it/s]    Fetching thickness data for subject 78 out of 116: : 78it [00:20,  4.28it/s]    Fetching thickness data for subject 79 out of 116: : 78it [00:20,  4.28it/s]    Fetching thickness data for subject 79 out of 116: : 79it [00:20,  4.29it/s]    Fetching thickness data for subject 80 out of 116: : 79it [00:20,  4.29it/s]    Fetching thickness data for subject 80 out of 116: : 80it [00:20,  4.25it/s]    Fetching thickness data for subject 81 out of 116: : 80it [00:20,  4.25it/s]    Fetching thickness data for subject 81 out of 116: : 81it [00:21,  4.11it/s]    Fetching thickness data for subject 82 out of 116: : 81it [00:21,  4.11it/s]    Fetching thickness data for subject 82 out of 116: : 82it [00:21,  4.13it/s]    Fetching thickness data for subject 83 out of 116: : 82it [00:21,  4.13it/s]    Fetching thickness data for subject 83 out of 116: : 83it [00:21,  4.27it/s]    Fetching thickness data for subject 84 out of 116: : 83it [00:21,  4.27it/s]    Fetching thickness data for subject 84 out of 116: : 84it [00:21,  4.16it/s]    Fetching thickness data for subject 85 out of 116: : 84it [00:21,  4.16it/s]    Fetching thickness data for subject 85 out of 116: : 85it [00:22,  4.06it/s]    Fetching thickness data for subject 86 out of 116: : 85it [00:22,  4.06it/s]    Fetching thickness data for subject 86 out of 116: : 86it [00:22,  3.86it/s]    Fetching thickness data for subject 87 out of 116: : 86it [00:22,  3.86it/s]    Fetching thickness data for subject 87 out of 116: : 87it [00:22,  3.98it/s]    Fetching thickness data for subject 88 out of 116: : 87it [00:22,  3.98it/s]    Fetching thickness data for subject 88 out of 116: : 88it [00:22,  4.01it/s]    Fetching thickness data for subject 89 out of 116: : 88it [00:22,  4.01it/s]    Fetching thickness data for subject 89 out of 116: : 89it [00:23,  3.92it/s]    Fetching thickness data for subject 90 out of 116: : 89it [00:23,  3.92it/s]    Fetching thickness data for subject 90 out of 116: : 90it [00:23,  3.62it/s]    Fetching thickness data for subject 91 out of 116: : 90it [00:23,  3.62it/s]    Fetching thickness data for subject 91 out of 116: : 91it [00:23,  3.00it/s]    Fetching thickness data for subject 92 out of 116: : 91it [00:23,  3.00it/s]    Fetching thickness data for subject 92 out of 116: : 92it [00:24,  3.35it/s]    Fetching thickness data for subject 93 out of 116: : 92it [00:24,  3.35it/s]    Fetching thickness data for subject 93 out of 116: : 93it [00:24,  3.66it/s]    Fetching thickness data for subject 94 out of 116: : 93it [00:24,  3.66it/s]    Fetching thickness data for subject 94 out of 116: : 94it [00:24,  3.90it/s]    Fetching thickness data for subject 95 out of 116: : 94it [00:24,  3.90it/s]    Fetching thickness data for subject 95 out of 116: : 95it [00:24,  4.07it/s]    Fetching thickness data for subject 96 out of 116: : 95it [00:24,  4.07it/s]    Fetching thickness data for subject 96 out of 116: : 96it [00:24,  4.10it/s]    Fetching thickness data for subject 97 out of 116: : 96it [00:24,  4.10it/s]    Fetching thickness data for subject 97 out of 116: : 97it [00:25,  4.19it/s]    Fetching thickness data for subject 98 out of 116: : 97it [00:25,  4.19it/s]    Fetching thickness data for subject 98 out of 116: : 98it [00:25,  4.26it/s]    Fetching thickness data for subject 99 out of 116: : 98it [00:25,  4.26it/s]    Fetching thickness data for subject 99 out of 116: : 99it [00:25,  4.33it/s]    Fetching thickness data for subject 100 out of 116: : 99it [00:25,  4.33it/s]    Fetching thickness data for subject 100 out of 116: : 100it [00:25,  4.42it/s]    Fetching thickness data for subject 101 out of 116: : 100it [00:25,  4.42it/s]    Fetching thickness data for subject 101 out of 116: : 101it [00:26,  4.48it/s]    Fetching thickness data for subject 102 out of 116: : 101it [00:26,  4.48it/s]    Fetching thickness data for subject 102 out of 116: : 102it [00:26,  4.38it/s]    Fetching thickness data for subject 103 out of 116: : 102it [00:26,  4.38it/s]    Fetching thickness data for subject 103 out of 116: : 103it [00:26,  4.41it/s]    Fetching thickness data for subject 104 out of 116: : 103it [00:26,  4.41it/s]    Fetching thickness data for subject 104 out of 116: : 104it [00:26,  4.19it/s]    Fetching thickness data for subject 105 out of 116: : 104it [00:26,  4.19it/s]    Fetching thickness data for subject 105 out of 116: : 105it [00:27,  4.19it/s]    Fetching thickness data for subject 106 out of 116: : 105it [00:27,  4.19it/s]    Fetching thickness data for subject 106 out of 116: : 106it [00:27,  4.30it/s]    Fetching thickness data for subject 107 out of 116: : 106it [00:27,  4.30it/s]    Fetching thickness data for subject 107 out of 116: : 107it [00:27,  4.06it/s]    Fetching thickness data for subject 108 out of 116: : 107it [00:27,  4.06it/s]    Fetching thickness data for subject 108 out of 116: : 108it [00:27,  3.95it/s]    Fetching thickness data for subject 109 out of 116: : 108it [00:27,  3.95it/s]    Fetching thickness data for subject 109 out of 116: : 109it [00:28,  4.06it/s]    Fetching thickness data for subject 110 out of 116: : 109it [00:28,  4.06it/s]    Fetching thickness data for subject 110 out of 116: : 110it [00:28,  4.18it/s]    Fetching thickness data for subject 111 out of 116: : 110it [00:28,  4.18it/s]    Fetching thickness data for subject 111 out of 116: : 111it [00:28,  4.35it/s]    Fetching thickness data for subject 112 out of 116: : 111it [00:28,  4.35it/s]    Fetching thickness data for subject 112 out of 116: : 112it [00:28,  4.36it/s]    Fetching thickness data for subject 113 out of 116: : 112it [00:28,  4.36it/s]    Fetching thickness data for subject 113 out of 116: : 113it [00:29,  3.82it/s]    Fetching thickness data for subject 114 out of 116: : 113it [00:29,  3.82it/s]    Fetching thickness data for subject 114 out of 116: : 114it [00:29,  3.52it/s]    Fetching thickness data for subject 115 out of 116: : 114it [00:29,  3.52it/s]    Fetching thickness data for subject 115 out of 116: : 115it [00:29,  3.48it/s]    Fetching thickness data for subject 116 out of 116: : 115it [00:29,  3.48it/s]    Fetching thickness data for subject 116 out of 116: : 116it [00:29,  3.57it/s]    Fetching thickness data for subject 116 out of 116: : 116it [00:29,  3.88it/s]
    /Users/reinder/GitHub/BrainStat/docs/python/tutorials/plot_tutorial_02_context.py:24: SettingWithCopyWarning:


    A value is trying to be set on a copy of a slice from a DataFrame

    See the caveats in the documentation: https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#returning-a-view-versus-a-copy

    /Users/reinder/GitHub/BrainStat/docs/python/tutorials/plot_tutorial_02_context.py:25: SettingWithCopyWarning:


    A value is trying to be set on a copy of a slice from a DataFrame

    See the caveats in the documentation: https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#returning-a-view-versus-a-copy





.. GENERATED FROM PYTHON SOURCE LINES 38-46

Genetics
--------

For genetic decoding we use the Allen Human Brain Atlas through the abagen
toolbox. Note that abagen only accepts parcellated data. Here is a minimal
example of how we use abagen to get the genetic expression of the 400 regions
of the Schaefer atlas. Please note that downloading the dataset and running this
analysis can take several minutes.

.. GENERATED FROM PYTHON SOURCE LINES 46-70

.. code-block:: default


    import copy

    import matplotlib.pyplot as plt
    import numpy as np
    from matplotlib.cm import get_cmap

    from brainstat.context.genetics import surface_genetic_expression
    from brainstat.datasets import fetch_parcellation

    # Get Schaefer-100 genetic expression.
    schaefer_100 = fetch_parcellation("fsaverage5", "schaefer", 100)
    surfaces = fetch_template_surface("fsaverage5", join=False)
    expression = surface_genetic_expression(schaefer_100, surfaces, space="fsaverage")

    # Plot Schaefer-100 genetic expression matrix.
    colormap = copy.copy(get_cmap())
    colormap.set_bad(color="black")
    plt.imshow(expression, aspect="auto", cmap=colormap)
    plt.colorbar()
    plt.xlabel("Genetic Expression")
    plt.ylabel("Schaefer 100 Regions")
    plt.show()




.. image:: /python/generated_tutorials/images/sphx_glr_plot_tutorial_02_context_001.png
    :alt: plot tutorial 02 context
    :class: sphx-glr-single-img





.. GENERATED FROM PYTHON SOURCE LINES 71-92

Expression is a pandas DataFrame which shows the genetic expression of genes
within each region of the atlas. By default, the values will fall in the range
[0, 1] where higher values represent higher expression. However, if you change
the normalization function then this may change. Some regions may return NaN
values for all genes. This occurs when there are no samples within this
region across all donors. We've denoted this region with the black color in the
matrix.

By default, BrainStat uses all the default abagen parameters. If you wish to
customize these parameters then the keyword arguments can be passed directly
to `surface_genetic_expression`. For a full list of these arguments and their
function please consult the abagen documentation.

Meta-Analytic
-------------
To perform meta-analytic decoding, BrainStat uses precomputed Neurosynth maps.
Here we test which terms are most associated with a map of cortical thickness.
A simple example analysis can be run as follows. The surface decoder
interpolates the data from the surface to the voxels in the volume that are in
between the two input surfaces. We'll decode the t-statistics derived with our model
earlier. Note that downloading the dataset and running this analysis can take several minutes.

.. GENERATED FROM PYTHON SOURCE LINES 92-98

.. code-block:: default


    from brainstat.context.meta_analysis import meta_analytic_decoder

    meta_analysis = meta_analytic_decoder("civet41k", slm_age.t.flatten())
    print(meta_analysis)





.. rst-class:: sphx-glr-script-out

 Out:

 .. code-block:: none

                         Pearson's r
    aphasia                 0.235244
    temporal pole           0.227986
    pole                    0.226801
    stroke                  0.208043
    silent                  0.198952
    ...                          ...
    cortex precuneus       -0.186695
    precuneus posterior    -0.199008
    virtual                -0.202482
    retrosplenial          -0.217467
    navigation             -0.284911

    [3228 rows x 1 columns]




.. GENERATED FROM PYTHON SOURCE LINES 99-102

meta_analysis now contains a pandas.dataFrame with the correlation values for
each requested feature. Next we could create a Wordcloud of the included terms,
wherein larger words denote higher correlations.

.. GENERATED FROM PYTHON SOURCE LINES 102-111

.. code-block:: default

    from wordcloud import WordCloud

    wc = WordCloud(background_color="white", random_state=0)
    wc.generate_from_frequencies(frequencies=meta_analysis.to_dict()["Pearson's r"])
    plt.imshow(wc)
    plt.axis("off")
    plt.show()





.. image:: /python/generated_tutorials/images/sphx_glr_plot_tutorial_02_context_002.png
    :alt: plot tutorial 02 context
    :class: sphx-glr-single-img





.. GENERATED FROM PYTHON SOURCE LINES 112-124

If we broadly summarize, we see a lot of words related to language e.g.,
"language comprehension", "broca", "speaking", "speech production".
Generally you'll also find several hits related to anatomy or clinical conditions.
Depending on your research question, it may be more interesting to
select only those terms related to cognition or some other subset.

Histological decoding
---------------------
For histological decoding we use microstructural profile covariance gradients,
as first shown by (Paquola et al, 2019, Plos Biology), computed from the
BigBrain dataset. Firstly, lets download the MPC data, compute its
gradients, and correlate the first two gradients with our t-statistic map.

.. GENERATED FROM PYTHON SOURCE LINES 124-144

.. code-block:: default


    import pandas as pd

    from brainstat.context.histology import (
        compute_histology_gradients,
        compute_mpc,
        read_histology_profile,
    )

    # Run the analysis
    schaefer_400 = fetch_parcellation("civet41k", "schaefer", 400)
    histology_profiles = read_histology_profile(template="civet41k")
    mpc = compute_mpc(histology_profiles, labels=schaefer_400)
    gradient_map = compute_histology_gradients(mpc, random_state=0)

    r = pd.DataFrame(gradient_map.gradients_[:, 0:2]).corrwith(
        pd.Series(slm_age.t.flatten())
    )
    print(r)





.. rst-class:: sphx-glr-script-out

 Out:

 .. code-block:: none

    /Users/reinder/GitHub/BrainStat/brainstat/context/histology.py:105: RuntimeWarning:

    divide by zero encountered in true_divide

    /Users/reinder/GitHub/BrainStat/brainstat/context/histology.py:105: RuntimeWarning:

    invalid value encountered in log

    0    0.014074
    1   -0.063980
    dtype: float64




.. GENERATED FROM PYTHON SOURCE LINES 145-153

The variable histology_profiles now contains histological profiles sampled at
50 different depths across the cortex, mpc contains the covariance of these
profiles, and gradient_map contains their gradients. We also see that the
correlations between our t-statistic map and these gradients are not very
high. Depending on your use-case, each of the three variables here could be of
interest, but for purposes of this tutorial we'll plot the gradients to the
surface with BrainSpace. For details on what the GradientMaps class
(gradient_map) contains please consult the BrainSpace documentation.

.. GENERATED FROM PYTHON SOURCE LINES 153-185

.. code-block:: default


    from brainspace.plotting.surface_plotting import plot_hemispheres
    from brainspace.utils.parcellation import map_to_labels

    surfaces = fetch_template_surface("civet41k", join=False)

    # Bring parcellated data to vertex data.
    vertexwise_data = []
    for i in range(0, 2):
        vertexwise_data.append(
            map_to_labels(
                gradient_map.gradients_[:, i],
                schaefer_400,
                mask=schaefer_400 != 0,
                fill=np.nan,
            )
        )

    # Plot to surface.
    plot_hemispheres(
        surfaces[0],
        surfaces[1],
        vertexwise_data,
        embed_nb=True,
        label_text=["Gradient 1", "Gradient 2"],
        color_bar=True,
        size=(1400, 400),
        zoom=1.45,
        nan_color=(0.7, 0.7, 0.7, 1),
        cb__labelTextProperty={"fontSize": 12},
    )




.. image:: /python/generated_tutorials/images/sphx_glr_plot_tutorial_02_context_003.png
    :alt: plot tutorial 02 context
    :class: sphx-glr-single-img


.. rst-class:: sphx-glr-script-out

 Out:

 .. code-block:: none

    /Users/reinder/opt/miniconda3/envs/python3.8/lib/python3.8/site-packages/brainspace/plotting/base.py:287: UserWarning:

    Interactive mode requires 'panel'. Setting 'interactive=False'


    <IPython.core.display.Image object>



.. GENERATED FROM PYTHON SOURCE LINES 186-200

Note that we no longer use the y-axis regression used in (Paquola et al, 2019,
Plos Biology), as such the first gradient becomes an anterior-posterior
gradient.

Resting-state contextualization
-------------------------------
Lastly, BrainStat provides contextualization using resting-state fMRI markers:
specifically, with the Yeo functional networks (Yeo et al., 2011, Journal of
Neurophysiology), a clustering of resting-state connectivity, and the
functional gradients (Margulies et al., 2016, PNAS), a lower dimensional
manifold of resting-state connectivity.

As an example, lets have a look at the first functional gradient within the
Yeo networks.

.. GENERATED FROM PYTHON SOURCE LINES 200-216

.. code-block:: default



    import matplotlib.pyplot as plt

    from brainstat.context.resting import yeo_networks_associations
    from brainstat.datasets import fetch_yeo_networks_metadata

    yeo_tstat = yeo_networks_associations(np.squeeze(slm_age.t), "civet41k")
    network_names, yeo_colormap = fetch_yeo_networks_metadata(7)

    plt.bar(np.arange(7), yeo_tstat[:, 0], color=yeo_colormap)
    plt.xticks(np.arange(7), network_names, rotation=90)
    plt.gcf().subplots_adjust(bottom=0.3)
    plt.show()





.. image:: /python/generated_tutorials/images/sphx_glr_plot_tutorial_02_context_004.png
    :alt: plot tutorial 02 context
    :class: sphx-glr-single-img





.. GENERATED FROM PYTHON SOURCE LINES 217-222

Across all networks, the mean t-statistic appears to be negative, with the
most negative values in the dorsal attnetion and visual networks.

Lastly, lets plot the functional gradients and have a look at their correlation
with our t-map.

.. GENERATED FROM PYTHON SOURCE LINES 222-240

.. code-block:: default


    from brainstat.datasets import fetch_gradients

    functional_gradients = fetch_gradients("civet41k", "margulies2016")

    plot_hemispheres(
        surfaces[0],
        surfaces[1],
        functional_gradients[:, 0:3].T,
        color_bar=True,
        label_text=["Gradient 1", "Gradient 2", "Gradient 3"],
        embed_nb=True,
        size=(1400, 600),
        zoom=1.45,
        nan_color=(0.7, 0.7, 0.7, 1),
        cb__labelTextProperty={"fontSize": 12},
    )




.. image:: /python/generated_tutorials/images/sphx_glr_plot_tutorial_02_context_005.png
    :alt: plot tutorial 02 context
    :class: sphx-glr-single-img


.. rst-class:: sphx-glr-script-out

 Out:

 .. code-block:: none

    /Users/reinder/opt/miniconda3/envs/python3.8/lib/python3.8/site-packages/brainspace/plotting/base.py:287: UserWarning:

    Interactive mode requires 'panel'. Setting 'interactive=False'


    <IPython.core.display.Image object>



.. GENERATED FROM PYTHON SOURCE LINES 241-246

.. code-block:: default


    r = pd.DataFrame(functional_gradients[:, 0:3]).corrwith(pd.Series(slm_age.t.flatten()))
    print(r)






.. rst-class:: sphx-glr-script-out

 Out:

 .. code-block:: none

    0    0.046822
    1    0.169228
    2    0.107790
    dtype: float64




.. GENERATED FROM PYTHON SOURCE LINES 247-258

It seems the correlations are quite low. However, we'll need some more complex
tests to assess statistical significance. There are many ways to compare these
gradients to cortical markers. In general, we recommend using corrections for
spatial autocorrelation which are implemented in BrainSpace. We'll show a
correction with spin test in this tutorial; for other methods and further
details please consult the BrainSpace tutorials.

In a spin test we compare the empirical correlation between the gradient and
the cortical marker to a distribution of correlations derived from data
rotated across the cortical surface. The p-value then depends on the
percentile of the empirical correlation within the permuted distribution.

.. GENERATED FROM PYTHON SOURCE LINES 258-297

.. code-block:: default



    from brainspace.null_models import SpinPermutations

    sphere_left, sphere_right = fetch_template_surface(
        "civet41k", layer="sphere", join=False
    )
    tstat = slm_age.t.flatten()
    tstat_left = tstat[: slm_age.t.size // 2]
    tstat_right = tstat[slm_age.t.size // 2 :]

    # Run spin test with 1000 permutations.
    n_rep = 1000
    sp = SpinPermutations(n_rep=n_rep, random_state=2021, surface_algorithm="CIVET")
    sp.fit(sphere_left, points_rh=sphere_right)
    tstat_rotated = np.hstack(sp.randomize(tstat_left, tstat_right))

    # Compute correlation for empirical and permuted data.
    mask = ~np.isnan(functional_gradients[:, 0]) & ~np.isnan(tstat)
    r_empirical = np.corrcoef(functional_gradients[mask, 0], tstat[mask])[0, 1]
    r_permuted = np.zeros(n_rep)
    for i in range(n_rep):
        mask = ~np.isnan(functional_gradients[:, 0]) & ~np.isnan(tstat_rotated[i, :])
        r_permuted[i] = np.corrcoef(functional_gradients[mask, 0], tstat_rotated[i, mask])[
            1:, 0
        ]

    # Significance depends on whether we do a one-tailed or two-tailed test.
    # If one-tailed it depends on in which direction the test is.
    p_value_right_tailed = np.mean(r_empirical > r_permuted)
    p_value_left_tailed = np.mean(r_empirical < r_permuted)
    p_value_two_tailed = np.minimum(p_value_right_tailed, p_value_left_tailed) * 2
    print(f"Two tailed p-value: {p_value_two_tailed}")

    # Plot the permuted distribution of correlations.
    plt.hist(r_permuted, bins=20, color="c", edgecolor="k", alpha=0.65)
    plt.axvline(r_empirical, color="k", linestyle="dashed", linewidth=1)
    plt.show()




.. image:: /python/generated_tutorials/images/sphx_glr_plot_tutorial_02_context_006.png
    :alt: plot tutorial 02 context
    :class: sphx-glr-single-img


.. rst-class:: sphx-glr-script-out

 Out:

 .. code-block:: none

    Two tailed p-value: 0.77




.. GENERATED FROM PYTHON SOURCE LINES 298-306

As we can see from both the p-value as well as the histogram, wherein the
dotted line denotes the empirical correlation, this correlation does not reach
significance.

That concludes the tutorials of BrainStat. If anything is unclear, or if you
think you've found a bug, please post it to the Issues page of our Github.

Happy BrainStating!


.. rst-class:: sphx-glr-timing

   **Total running time of the script:** ( 6 minutes  49.784 seconds)


.. _sphx_glr_download_python_generated_tutorials_plot_tutorial_02_context.py:


.. only :: html

 .. container:: sphx-glr-footer
    :class: sphx-glr-footer-example



  .. container:: sphx-glr-download sphx-glr-download-python

     :download:`Download Python source code: plot_tutorial_02_context.py <plot_tutorial_02_context.py>`



  .. container:: sphx-glr-download sphx-glr-download-jupyter

     :download:`Download Jupyter notebook: plot_tutorial_02_context.ipynb <plot_tutorial_02_context.ipynb>`


.. only:: html

 .. rst-class:: sphx-glr-signature

    `Gallery generated by Sphinx-Gallery <https://sphinx-gallery.github.io>`_
