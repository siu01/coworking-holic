import AppKit

let width: CGFloat = 1200
let height: CGFloat = 630
let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let outputURL = root.appendingPathComponent("og-image.png")
let coverURL = root.appendingPathComponent("book-cover.png")

func color(_ hex: UInt32) -> NSColor {
    let r = CGFloat((hex >> 16) & 0xff) / 255
    let g = CGFloat((hex >> 8) & 0xff) / 255
    let b = CGFloat(hex & 0xff) / 255
    return NSColor(calibratedRed: r, green: g, blue: b, alpha: 1)
}

func font(_ names: [String], size: CGFloat, fallback: NSFont) -> NSFont {
    for name in names {
        if let found = NSFont(name: name, size: size) {
            return found
        }
    }
    return fallback
}

func drawText(_ text: String, in rect: NSRect, font: NSFont, color: NSColor, lineSpacing: CGFloat = 0, kern: CGFloat = 0) {
    let paragraph = NSMutableParagraphStyle()
    paragraph.lineSpacing = lineSpacing
    paragraph.lineBreakMode = .byWordWrapping
    let attrs: [NSAttributedString.Key: Any] = [
        .font: font,
        .foregroundColor: color,
        .paragraphStyle: paragraph,
        .kern: kern
    ]
    (text as NSString).draw(with: rect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: attrs)
}

guard
    let bitmap = NSBitmapImageRep(
        bitmapDataPlanes: nil,
        pixelsWide: Int(width),
        pixelsHigh: Int(height),
        bitsPerSample: 8,
        samplesPerPixel: 4,
        hasAlpha: true,
        isPlanar: false,
        colorSpaceName: .deviceRGB,
        bytesPerRow: 0,
        bitsPerPixel: 0
    ),
    let context = NSGraphicsContext(bitmapImageRep: bitmap)
else {
    fatalError("Failed to create bitmap context.")
}

bitmap.size = NSSize(width: width, height: height)
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = context
context.imageInterpolation = .high

color(0xFAFAF8).setFill()
NSRect(x: 0, y: 0, width: width, height: height).fill()

let titleFont = font(["Hiragino Mincho ProN W6", "YuMincho-Demibold", "Hiragino Sans W7"], size: 78, fallback: .boldSystemFont(ofSize: 78))
let sansBold = font(["Hiragino Sans W7", "Noto Sans JP Bold", "HelveticaNeue-Bold"], size: 22, fallback: .boldSystemFont(ofSize: 22))
let sans = font(["Hiragino Sans W4", "Noto Sans JP Regular", "HelveticaNeue"], size: 24, fallback: .systemFont(ofSize: 24))
let mono = font(["Montserrat-Bold", "HelveticaNeue-Bold"], size: 18, fallback: .boldSystemFont(ofSize: 18))

drawText("COWORKING-HOLIC", in: NSRect(x: 72, y: 536, width: 560, height: 34), font: mono, color: color(0x333333), kern: 1.6)
drawText("コワーキング\nホリック", in: NSRect(x: 68, y: 294, width: 620, height: 210), font: titleFont, color: color(0x1F1F1F), lineSpacing: 7, kern: 0)
drawText("吉永 亮 著 / GRANDSLAM Founder", in: NSRect(x: 72, y: 245, width: 560, height: 36), font: sansBold, color: color(0x333333))
drawText("大阪・福島発。場所と人とコミュニティの物語。", in: NSRect(x: 72, y: 178, width: 610, height: 70), font: sans, color: color(0x555555), lineSpacing: 5)
drawText("定価 ¥1,980（税込）", in: NSRect(x: 72, y: 112, width: 260, height: 32), font: sansBold, color: color(0x333333))

if let cover = NSImage(contentsOf: coverURL) {
    let coverRect = NSRect(x: 792, y: 74, width: 326, height: 452)
    let shadow = NSShadow()
    shadow.shadowColor = NSColor.black.withAlphaComponent(0.18)
    shadow.shadowBlurRadius = 18
    shadow.shadowOffset = NSSize(width: 0, height: -8)
    shadow.set()
    color(0xFFFFFF).setFill()
    NSBezierPath(roundedRect: coverRect, xRadius: 10, yRadius: 10).fill()
    NSShadow().set()
    cover.draw(in: coverRect, from: .zero, operation: .sourceOver, fraction: 1, respectFlipped: true, hints: [.interpolation: NSImageInterpolation.high])
}

drawText("coworking-holic.pages.dev", in: NSRect(x: 792, y: 548, width: 330, height: 26), font: mono, color: color(0x555555), kern: 0.3)

context.flushGraphics()
NSGraphicsContext.restoreGraphicsState()

guard
    let png = bitmap.representation(using: .png, properties: [:])
else {
    fatalError("Failed to render OGP image.")
}

try png.write(to: outputURL)
print("Wrote \(outputURL.path)")
