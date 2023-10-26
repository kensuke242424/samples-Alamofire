//
//  APIManager.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/25.
//

import Foundation
import Alamofire

class RestCountriesAPI {
    static var shared = RestCountriesAPI()

    let baseURL = "https://restcountries.com/v3.1"

    func fetchAllCountries() async throws -> [Country]? {
        let searchPath = "/all"

        let dataTask = AF.request(baseURL + searchPath, method: .get)
            .serializingDecodable([Country].self)
        let response = await dataTask.response

        switch response.result {

        case .success(let countries):
            print(countries)
            return countries

        case .failure(let afError):
            print(String(describing: afError))
            // localizedDescriptionにはコンテキストがないため、おすすめしない
            // print("ERROR: \(afError.localizedDescription)")
            throw afError
        }
    }

    func handleRequest(completion: @escaping (Result<[Country], Error>) -> Void) {

            let urlString = "https://restcountries.com/v3.1/all"

            let url = URL(string: urlString)

            let request = URLRequest(url: url!)

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()

                    do {
                        let articles = try decoder.decode([Country].self, from: data)
                        completion(.success(articles))

                    } catch let error {
                        print("Error was \(error)")
                        completion(.failure(error))
                    }
                }

                if let error = error {
                    print("ERRRRROOR \(error)")
                }

            }
            task.resume()

        }
}
