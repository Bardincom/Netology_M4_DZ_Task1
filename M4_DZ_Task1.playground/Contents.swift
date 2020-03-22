import Foundation

//В этом практическом задании вам предстоит написать многопоточный код в playground, используя класс Thread. В папке с заданием лежит файл Bread.swift с одноименной структурой, которую нужно будет использовать при выполнении задания. Для этого добавьте его в свой плейграунд. Менять код в этом файле нельзя.
//
//Функциональные требования
//
//Выполнять задание нужно в playground.
//Необходимо создать два сабкласса Thread. Один из них будет порождающим потоком, а второй рабочим.
//Порождающий поток должен каждые 2 секунды создавать новый экземпляр структуры Bread используя метод make().
//Созданный экземпляр он должен положить в хранилище, работающее по принципу LIFO. (хранилище нужно создать самостоятельно)
//Выполнение порождающего потока должно длиться 20 секунд.
//Хранилище для “хлеба” должно быть потокобезопасно.
//Рабочий поток должен ожидать появления экземпляров структуры Bread в хранилище.
//При его появлении рабочий поток забирает один “хлеб” из хранилища и вызывает метод bake().
//Также он поступает и с другими экземплярами если они есть в хранилище. Если нет, то снова приостанавливается в ожидании.
//Во время того, как рабочий поток “печет хлеб” порождающий поток продолжает выполнение и при срабатывании таймера должен также положить новую сущность Bread в хранилище.
//После окончания выполнения порождающего потока рабочий поток обрабатывает экземпляры Bread, оставшиеся в хранилище, и тоже заканчивает свое выполнение.
//Добавьте также в плейграунд код, создающий экземпляры этих потоков и запускающий их выполнение.


public struct Bread {
    public enum BreadType: UInt32 {
        case small = 1
        case medium
        case big
    }
    
    public let breadType: BreadType
    
    public static func make() -> Bread {
        guard let breadType = Bread.BreadType(rawValue: UInt32(arc4random_uniform(3) + 1)) else {
            fatalError("Incorrect random value")
        }
        
        return Bread(breadType: breadType)
    }
    
    public func bake() {
        let bakeTime = breadType.rawValue
        sleep(UInt32(bakeTime))
    }
}

