import React from 'react';
import { FlatList, Text, StyleSheet, View } from 'react-native';

const styles = StyleSheet.create({
    container: {
        flex: 1,
        paddingTop: 20,
    },
    item: {
        padding: 10,
        fontSize: 18,
        height: 44,
    },
    sectionHeader: {
        padding: 10,
        fontSize: 18,
        height: 44,
        backgroundColor: 'red',
    },
});

const FlatListBasic = () => {
    return (
        <>
            <View style={styles.container}>
                <FlatList
                    data={[
                        { key: 'a' },
                        { key: 'b' },
                        { key: 'c' },
                        { key: 'd' },
                        { key: 'e' },
                        { key: 'f' },
                        { key: 'g' },
                        { key: 'h' },
                    ]}
                    renderItem={({ item }) => <Text style={styles.item}>{item.key}</Text>}
                />
            </View>
            <SectionList
                sections={[
                    { title: 'A', data: ['a', 'b', 'c'] },
                    { title: 'B', data: ['d', 'e', 'f'] },
                ]}
                renderItem={({ item }) => <Text style={styles.item}>{item}</Text>}
                renderSectionHeader={({ section: { title } }) => (
                    <Text style={styles.sectionHeader}>{title}</Text>
                        keyExtractor={(item, index) => index.toString()}
                    )}
                />
        </>
    );
}

const Greeting =（props) => {
    return (
        <View>
            <Text>Hello, {props.name}!</Text>
        </View>
    )
}

export default LotsOfGreetings = () => {
    return (
        <View style={{alignItems: 'center', top: 50}}>
            <Greeting name="Rexxar" />
            <Greeting name="Jaina" />
            <Greeting name="Valeera" />
        </View>
    )
}
export default FlatListBasic;

