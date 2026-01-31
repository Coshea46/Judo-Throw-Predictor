# 🥋 AI Judo Coach: Data & Pose Extraction

A deep learning pipeline designed to analyze Judo matches by extracting pose-estimation data from high-level competition footage. This project bridges the gap between traditional martial arts coaching and modern biomechanical AI.

## 🚀 Overview
This repository contains the first phase of the **AI Judo Coach** project: a custom pipeline for filtering, labeling, and transforming raw broadcast footage into skeletal tensors ready for LSTM training.

## 📊 The Dataset
Since no public Judo pose dataset exists, I built a custom one from scratch to handle the unique challenges of the sport.

* **Source:** International Judo Federation (IJF) / YouTube competition footage.
* **Volume:** 2,500 total clips (1,000 Throws / 1,500 Non-throws).
* **Labor:** 40+ hours of manual temporal annotation (identifying start/end frames of techniques).
* **Data Pipeline:** Raw `.mp4` $\rightarrow$ YOLO11 Inference $\rightarrow$ Processed `.npy` (NumPy tensors).

## 🛠️ Technical Stack

| Component | Technology |
| :--- | :--- |
| **Pose Estimation** | [Ultralytics YOLO11](https://docs.ultralytics.com/) |
| **Data Processing** | FFmpeg |
| **Language** | Python |
| **Tracking Logic** | Color-based skeleton filtering (White vs. Blue Gi) |

---

## 🧠 Key Challenges & Solutions

### 1. The "Blob" Problem (High Occlusion)
Judo involves constant physical contact, making it difficult for standard models to distinguish between two athletes. To maintain data integrity:
* **Feature Priority:** The pipeline prioritizes the **7 Key Biomechanical Points**: Hips, Elbows, Head, and Ankles.
* **Temporal Smoothing:** Uses **Linear Interpolation** to fill gaps when a joint is hidden for $< 5$ frames, ensuring the LSTM receives a continuous sequence.

### 2. Multi-Person Filtering
Broadcasts often show referees, coaches, or crowd members. To ensure the model only "watches" the fighters, I implemented a dual-filter:
* **Bounding Box Area:** The system assumes the two primary fighters are the largest subjects in the frame.
* **Colour Histograms:** Cross-referencing detected skeleton regions with the expected RGB values of **White** vs. **Blue** Gis to assign identities (Player A vs. Player B).

---

## 📁 Repository Structure
```text
Judo-Throw-Predictor/
├── .vscode/                 # Editor-specific configurations
├── No-throw-attempts/       # Part of old approach to the data
├── blog-stuff/              # Assets and drafts for blog posts
├── frame-extraction/        # Scripts/data for pulling frames from video
├── new-data-approach/       # Documentation or code for updated strategy
├── organising-raw-videos/   # Initial steps for video curation
├── scripts/                 # Data Wrangling scripts
└── README.md                # Project documentation
