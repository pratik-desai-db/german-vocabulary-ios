import Foundation
import XCTest

final class AppIconTests: XCTestCase {
    private var root: URL {
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
    }

    func testIconCatalogAndOpaqueSRGBMaster() throws {
        let catalog = root.appendingPathComponent("App/Assets.xcassets/AppIcon.appiconset")
        let data = try Data(contentsOf: catalog.appendingPathComponent("Contents.json"))
        let manifest = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
        let images = try XCTUnwrap(manifest["images"] as? [[String: String]])
        XCTAssertEqual(images.count, 1)
        let image = try XCTUnwrap(images.first)
        XCTAssertEqual(image["idiom"], "universal")
        XCTAssertEqual(image["platform"], "ios")
        XCTAssertEqual(image["size"], "1024x1024")
        let filename = try XCTUnwrap(image["filename"])
        XCTAssertEqual(filename, "AppIcon.png")
        let png = [UInt8](try Data(contentsOf: catalog.appendingPathComponent(filename)))
        XCTAssertEqual(Array(png.prefix(8)), [137, 80, 78, 71, 13, 10, 26, 10])

        func uint32(at offset: Int) -> Int {
            png[offset..<(offset + 4)].reduce(0) { ($0 << 8) | Int($1) }
        }

        var offset = 8
        var chunks = [String]()
        while offset + 12 <= png.count {
            let length = uint32(at: offset)
            guard length <= png.count - offset - 12 else {
                return XCTFail("Truncated PNG chunk")
            }
            let type = String(decoding: png[(offset + 4)..<(offset + 8)], as: UTF8.self)
            chunks.append(type)
            if type == "IHDR" {
                XCTAssertEqual(length, 13)
                guard length == 13 else { return }
                XCTAssertEqual(uint32(at: offset + 8), 1024)
                XCTAssertEqual(uint32(at: offset + 12), 1024)
                XCTAssertEqual(png[offset + 16], 8, "Use 8 bits per channel")
                XCTAssertEqual(png[offset + 17], 2, "Use RGB, not grayscale, palette, or alpha")
            }
            offset += length + 12
        }
        XCTAssertEqual(offset, png.count)
        XCTAssertEqual(chunks.first, "IHDR")
        XCTAssertEqual(chunks.last, "IEND")
        XCTAssertTrue(chunks.contains("IDAT"))
        XCTAssertTrue(chunks.contains("sRGB"))
        XCTAssertFalse(chunks.contains("tRNS"), "App icons must not contain transparency")
    }

    func testAppTargetCompilesCatalogInBothConfigurations() throws {
        let project = try String(
            contentsOf: root.appendingPathComponent("DeutschDaily.xcodeproj/project.pbxproj"),
            encoding: .utf8
        )
        XCTAssertTrue(project.contains("lastKnownFileType = folder.assetcatalog; path = Assets.xcassets;"))
        XCTAssertTrue(project.contains("B4CECA40DB344A18A49B0192 /* Assets.xcassets */,\n"))
        XCTAssertTrue(project.contains("B4CECA40DB344A18A49B0191 /* Assets.xcassets in Resources */,\n"))
        for id in ["00EC4F8DB90739A2C6F474D8", "901900834712C037C56CF401"] {
            let start = try XCTUnwrap(project.range(of: "\(id) /*"))
            let section = project[start.lowerBound...]
            let end = try XCTUnwrap(section.range(of: "};"))
            XCTAssertTrue(section[..<end.lowerBound].contains("ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;"))
        }
    }
}
