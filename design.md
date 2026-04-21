# Design System: GRANDSLAM (grandslam.osaka)

## 1. Design Concept
### 「熱量と余白」
大阪福島のクリエイティブな拠点として、ビジネスの「熱量」を感じさせる力強い要素と、集中や交流を生むための「心地よい余白」を共存させる。

---

## 2. Color Palette

| 用途 | カラー名 | HEX | 特徴 |
| :--- | :--- | :--- | :--- |
| **Primary** | Action Orange | `#F36E21` | ロゴ色。情熱、活気、太陽を象徴。 |
| **Secondary** | Deep Graphite | `#333333` | 文字色、ヘッダー等。安定感とプロ感。 |
| **Accent** | Sky Clear Blue | `#00A0E9` | リンク、サブ要素。爽やかさと信頼。 |
| **Base** | Paper White | `#FFFFFF` | 背景色。情報の整理と清潔感。 |
| **Section** | Light Mist | `#F8F8F8` | セクション区切り。コンテンツの視認性向上。 |

---

## 3. Typography

### 3.1 Font Family
* **Sans-serif (JP/EN):** `Noto Sans JP`, `Montserrat`, `sans-serif`
    * モダンで力強く、あらゆるデバイスで視認性が高い組み合わせ。

### 3.2 Scale
- **H1 (Hero):** 40px / Bold / Tracking: 0.05em
- **H2 (Section Title):** 32px / Bold / Border-bottom: Action Orange
- **H3 (Card Title):** 20px / Bold
- **Body:** 16px / Regular / Line-height: 1.8
- **Caption:** 12px / Medium / Color: Gray

---

## 4. UI Components

### 4.1 Buttons
* **Primary Button:**
    * Background: `#F36E21`
    * Text: White / Bold
    * Shape: Rounded-full (カプセル型)
    * Interaction: Hover時に不透明度を0.8にする、または微細な浮き上がり。
* **Ghost Button:**
    * Border: 2px solid `#F36E21`
    * Text: `#F36E21`
    * Background: Transparent

### 4.2 Cards
* **Service Card:**
    * 白い背景に薄いドロップシャドウ (`0 4px 20px rgba(0,0,0,0.05)`)
    * 角丸 (`border-radius: 12px`)
    * ホバー時に画像が少しズームするアニメーション。

### 4.3 Icons
* ミニマルなラインアイコンを使用。
* アクセントカラー（Orange）をアイコンの配色に取り入れる。

---

## 5. Layout & Visual Guidelines

### 5.1 Grid System
* **Max-width:** 1200px
* **Gutter:** 24px (Mobile: 16px)
* **Padding:** セクション間に十分な余白（80px〜120px）を設け、窮屈さを排除する。

### 5.2 Imagery
* **人々の表情:** 「作業中」だけでなく「談笑中」「イベント中」の写真を使い、コミュニティの温度感を伝える。
* **空間写真:** 自然光が入る明るい写真をベースにし、各部屋（GalaxyRoom等）の個性を強調。

### 5.3 Animations
* **Scroll Reveal:** 画面スクロールに合わせて、下からふんわりと要素が浮き上がる演出。
* **Parallax:** ヒーローセクションに微弱なパララックスをかけ、奥行きを出す。

---

## 6. Tone of Voice
* **親しみやすさ:** 「〜です・ます」調を基本としつつ、堅苦しすぎない表現。
* **ワクワク感:** 利用者が「ここなら何かが始まりそう」と思えるような、ポジティブな言葉選び。